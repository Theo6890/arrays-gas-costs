// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/**
 * @notice Contract to test the impact of looping on arrays of thousands
 *         elements.
 * @dev Remember that on mainnet the gas limit is fixed at 30M gas.
 *
 * It consumes 44,500 more gas to save randoms in randoms
 */
contract Transform {
    uint256[] public randoms;
    uint256[] public result;

    function setRandoms(uint256[] memory _randoms) external {
        randoms = _randoms;
    }

    /*//////////////////////////////////////////////////////////////
                                 RESULT IN MEMORY
    //////////////////////////////////////////////////////////////*/
    /// @dev consume 38M gas with `amountRandToTransform_` = 50,000
    function transformRandoms_result_to_memory(
        uint256 amountRandToTransform
    ) external view returns (uint256[] memory transformed) {
        transformed = new uint256[](amountRandToTransform);
        uint256[] memory randoms_ = randoms; // saves ~11.5M gas

        for (uint256 i = 0; i < amountRandToTransform; ++i) {
            transformed[i] = randoms_[i] % amountRandToTransform;
        }
    }

    /// @dev consume 28M gas with `amountRandToTransform_` = 50,000
    function YUL_transformRandoms_result_to_memory(
        uint256 amountRandToTransform_
    ) external view returns (uint256[] memory transformed) {
        transformed = new uint256[](amountRandToTransform_);
        uint256[] memory randoms_ = randoms; // saves ~5,500 gas
        uint256 randomAtIndex;

        // yul saves ~10M gas
        assembly {
            // for memory array index 0 is amountRandToTransform, then data stored from 1 to amountRandToTransform
            for {
                let i := 1
            } lt(i, add(amountRandToTransform_, 1)) {
                i := add(i, 1)
            } {
                // reads: randoms_[i]
                randomAtIndex := mload(add(randoms_, mul(i, 0x20)))

                // transformed[i] = randomAtIndex % amountRandToTransform_
                mstore(
                    add(transformed, mul(i, 0x20)), // transformed[i]
                    mod(randomAtIndex, amountRandToTransform_) // randomAtIndex % amountRandToTransform_
                )
            }
        }
    }

    /*//////////////////////////////////////////////////////////////
                                 RESULT IN STORAGE
    //////////////////////////////////////////////////////////////*/
    function transformRandoms_result_to_storage(
        uint256 amountRandToTransform
    ) external returns (uint256[] memory transformed) {
        transformed = new uint256[](amountRandToTransform);
        uint256[] memory randoms_ = randoms; // saves ~11.5M gas

        for (uint256 i = 0; i < amountRandToTransform; ++i) {
            transformed[i] = randoms_[i] % amountRandToTransform;
        }
        result = randoms_;
    }

    function YUL_transformRandoms_result_to_storage(
        uint256 amountRandToTransform_
    ) external returns (uint256[] memory transformed) {
        transformed = new uint256[](amountRandToTransform_);
        uint256[] memory randoms_ = randoms; // saves ~5,500 gas
        uint256 randomAtIndex;

        // yul saves ~10M gas
        assembly {
            // for memory array index 0 is amountRandToTransform, then data stored from 1 to amountRandToTransform
            for {
                let i := 1
            } lt(i, add(amountRandToTransform_, 1)) {
                i := add(i, 1)
            } {
                // reads: randoms_[i]
                randomAtIndex := mload(add(randoms_, mul(i, 0x20)))

                // transformed[i] = randomAtIndex % amountRandToTransform_
                mstore(
                    add(transformed, mul(i, 0x20)), // transformed[i]
                    mod(randomAtIndex, amountRandToTransform_) // randomAtIndex % amountRandToTransform_
                )
            }
        }

        result = randoms_;
    }
}
