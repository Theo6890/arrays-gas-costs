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

    constructor() {
        randoms.push(12489031409234);
    }

    // TODO: try if calldata is better than memory
    function YUL_transformAndPick_result_to_memory(
        address[] memory addresses
    ) external view returns (address[] memory transformed) {
        uint256 length_ = addresses.length;
        transformed = new address[](length_);
        uint256[] memory randoms_ = randoms; // saves ~5,500 gas

        // yul saves ~10M gas
        assembly {
            // reads randoms at index 0
            let randomAtIndex := mload(add(randoms_, 0x20))

            // for memory array index 0 is length, then data stored from 1 to length
            for {
                let i := 1
            } lt(i, add(length_, 1)) {
                i := add(i, 1)
            } {
                // transformed[i] = randomAtIndex % length_
                mstore(
                    add(transformed, mul(i, 0x20)), // transformed[i]
                    mload(
                        add(addresses, mul(mod(randomAtIndex, length_), 0x20))
                    ) // load data at: addresses[randoms_[0] % length]
                )
            }
        }
    }

    function YUL_transformAndPick_result_to_storage(
        address[] memory addresses
    ) external returns (address[] memory transformed) {
        uint256 length_ = addresses.length;
        transformed = new address[](length_);
        uint256[] memory randoms_ = randoms; // saves ~5,500 gas

        // yul saves ~10M gas
        assembly {
            // reads randoms at index 0
            let randomAtIndex := mload(add(randoms_, 0x20))

            // for memory array index 0 is length, then data stored from 1 to length
            for {
                let i := 1
            } lt(i, add(length_, 1)) {
                i := add(i, 1)
            } {
                // transformed[i] = randomAtIndex % length_
                mstore(
                    add(transformed, mul(i, 0x20)), // transformed[i]
                    mload(
                        add(addresses, mul(mod(randomAtIndex, length_), 0x20))
                    ) // load data at: addresses[randoms_[0] % length]
                )
            }
        }

        result = transformed;
    }
}
