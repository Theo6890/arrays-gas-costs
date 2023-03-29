// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/**
 * @notice Contract to test the impact of looping on arrays of thousands
 *         elements.
 * @dev Remember that on mainnet the gas limit is fixed at 30M gas.
 *
 * It consumes 44,500 more gas to save randoms in randoms
 */
contract TransformAndPickAddress {
    uint256[] public randoms;
    address[] public result;

    function setRandoms(uint256[] memory _randoms) external {
        randoms = _randoms;
    }

    // TODO: try if calldata is better than memory
    function YUL_transformAndPick_result_to_memory(
        address[] memory addresses,
        uint256 amountOfWinners
    ) external view returns (address[] memory winners) {
        winners = new address[](amountOfWinners);
        uint256[] memory randoms_ = randoms; // saves ~5,500 gas
        uint256 randomAtIndex;

        // yul saves ~10M gas
        assembly {
            // for memory array index 0 is length, then data stored from 1 to length
            for {
                let i := 1
            } lt(i, add(amountOfWinners, 1)) {
                i := add(i, 1)
            } {
                // reads: randoms_[i]
                randomAtIndex := mload(add(randoms_, mul(i, 0x20)))

                // winners[i] = addresses[randomAtIndex % amountOfWinners] (in memory)
                mstore(
                    add(winners, mul(i, 0x20)), // winners[i]
                    mload(
                        add(
                            addresses,
                            mul(mod(randomAtIndex, amountOfWinners), 0x20)
                        )
                    ) // load data at: addresses[randomAtIndex % amountOfWinners]
                )
            }
        }
    }

    function YUL_transformAndPick_removeSelectedWinners_inMemory(
        address[] memory addresses,
        uint256 amountOfWinners
    ) external view returns (address[] memory winners) {
        winners = new address[](amountOfWinners);
        uint256[] memory randoms_ = randoms; // saves ~5,500 gas
        uint256 randomAtIndex;

        // yul saves ~10M gas
        assembly {
            let memoryPos
            let newWinnerPos

            // arrayTo[toIndex] = arrayFrom[fromIndex]
            function storeToFrom(arrayTo, toIndex, arrayFrom, fromIndex) {
                mstore(add(arrayTo, toIndex), mload(add(arrayFrom, fromIndex)))
            }
            // current data <-> last data
            function swapCurrentAndLast(currentIndexPos, array) {
                let current := mload(add(array, currentIndexPos))
                let length := mload(array)
                let lastElemPos := mul(length, 0x20)
                // array[i] = array[array.last]
                storeToFrom(array, currentIndexPos, array, lastElemPos)
                // array[array.last] = current
                mstore(add(array, lastElemPos), current)
            }

            for {
                let i := 0
            } lt(i, amountOfWinners) {
                i := add(i, 1)
            } {
                // memory array:
                //  - index at 0 is array.length
                //  - index of data stored starts at 1
                memoryPos := mul(add(i, 1), 0x20)
                // reads: randoms_[i]
                randomAtIndex := mload(add(randoms_, memoryPos))
                // add 1 as addresses[] is in memory
                newWinnerPos := mul(
                    add(mod(randomAtIndex, amountOfWinners), 1),
                    0x20
                )

                // winners[i] = addresses[newWinnerPos]
                storeToFrom(winners, memoryPos, addresses, newWinnerPos)
                // addresses[newWinnerPos] <-> addresses[array.last]
                swapCurrentAndLast(newWinnerPos, addresses)
                // addresses.pop() - deletes addresses[array.last]
                mstore(addresses, sub(mload(addresses), 1))
            }
        }
    }

    function YUL_transformAndPick_result_to_storage(
        address[] memory addresses,
        uint256 amountOfWinners
    ) external returns (address[] memory winners) {
        winners = new address[](amountOfWinners);
        uint256[] memory randoms_ = randoms; // saves ~5,500 gas
        uint256 randomAtIndex;

        // yul saves ~10M gas
        assembly {
            // for memory array index 0 is length, then data stored from 1 to length
            for {
                let i := 1
            } lt(i, add(amountOfWinners, 1)) {
                i := add(i, 1)
            } {
                // reads: randoms_[i]
                randomAtIndex := mload(add(randoms_, mul(i, 0x20)))

                // winners[i] = addresses[randomAtIndex % amountOfWinners] (in storage)
                mstore(
                    add(winners, mul(i, 0x20)), // winners[i]
                    mload(
                        add(
                            addresses,
                            mul(mod(randomAtIndex, amountOfWinners), 0x20)
                        )
                    ) // get data of: addresses[randomAtIndex % amountOfWinners]
                )
            }
        }

        result = winners;
    }
}
