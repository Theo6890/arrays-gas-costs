// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/**
 * @notice Contract to test the impact of looping on arrays of thousands
 *         elements.
 * @dev Remember that on mainnet the gas limit is fixed at 30M gas.
 *
 * It consumes 44,500 more gas to save transformedrands in transformedrands
 */
contract PickAfterTransform {
    uint256[] public transformedrands;
    address[] public result;

    function setTransformedRands(uint256[] memory _transformedrands) external {
        transformedrands = _transformedrands;
    }

    function YUL_pickAfterTransform_result_to_memory(
        address[] memory addresses,
        uint256 amountOfWinners
    ) external view returns (address[] memory winners) {
        winners = new address[](amountOfWinners);
        uint256[] memory transformedrands_ = transformedrands; // saves ~5,500 gas

        // yul saves ~10M gas
        assembly {
            // for memory array index 0 is length, then data stored from 1 to length
            for {
                let i := 1
            } lt(i, add(amountOfWinners, 1)) {
                i := add(i, 1)
            } {
                // winners[i] = addresses[transformedrands_[i]]
                mstore(
                    add(winners, mul(i, 0x20)), // winners[i]
                    mload(
                        add(
                            addresses,
                            mul(
                                mload(add(transformedrands_, mul(i, 0x20))), // transformedrands_[i]
                                0x20
                            )
                        )
                    ) // load data at: addresses[transformedrands_[i]]
                )
            }
        }
    }

    function YUL_pickAfterTransform_result_to_storage(
        address[] memory addresses,
        uint256 amountOfWinners
    ) external returns (address[] memory winners) {
        winners = new address[](amountOfWinners);
        uint256[] memory transformedrands_ = transformedrands; // saves ~5,500 gas

        // yul saves ~10M gas
        assembly {
            // for memory array index 0 is length, then data stored from 1 to length
            for {
                let i := 1
            } lt(i, add(amountOfWinners, 1)) {
                i := add(i, 1)
            } {
                // winners[i] = addresses[transformedrands_[i]]
                mstore(
                    add(winners, mul(i, 0x20)), // winners[i]
                    mload(
                        add(
                            addresses,
                            mul(
                                mload(add(transformedrands_, mul(i, 0x20))), // transformedrands_[i]
                                0x20
                            )
                        )
                    ) // load data at: addresses[transformedrands_[i]]
                )
            }
        }

        result = winners;
    }
}
