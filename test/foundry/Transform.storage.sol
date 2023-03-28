// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../../src/Transform.sol";

contract TransformTest is Test {
    Transform public instance;

    uint256[] randoms_27_000;
    uint256[] randoms_22_000;
    uint256[] randoms_19_000;
    uint256[] randoms_11_000;
    uint256[] randoms_5_000;
    uint256[] randoms_2_300;
    uint256[] randoms_834;
    uint256[] randoms_124;
    uint256[] randoms_75;

    function setUp() public {
        instance = new Transform();

        for (uint256 i; i < 27_000; ++i) {
            randoms_27_000.push(12489031409234 + i);
            if (i < 22_000) randoms_22_000.push(12489031409234 + i);
            if (i < 19_000) randoms_19_000.push(12489031409234 + i);
            if (i < 11_000) randoms_11_000.push(12489031409234 + i);
            if (i < 5_000) randoms_5_000.push(12489031409234 + i);
            if (i < 2_300) randoms_2_300.push(12489031409234 + i);
            if (i < 834) randoms_834.push(12489031409234 + i);
            if (i < 124) randoms_124.push(12489031409234 + i);
            if (i < 75) randoms_75.push(12489031409234 + i);
        }
    }

    /*//////////////////////////////////////////////////////////////
                            SOLIDITY
    //////////////////////////////////////////////////////////////*/
    function test_transformRandomsToMatchRange_result_to_storage_27_000_randoms()
        public
    {
        instance.setRandoms(randoms_27_000);
        uint256[] memory result = instance.transformRandoms_result_to_storage(
            27_000
        );
        assertEq(result.length, 27_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_22_000_randoms()
        public
    {
        instance.setRandoms(randoms_22_000);
        uint256[] memory result = instance.transformRandoms_result_to_storage(
            22_000
        );
        assertEq(result.length, 22_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_19_000_randoms()
        public
    {
        instance.setRandoms(randoms_19_000);
        uint256[] memory result = instance.transformRandoms_result_to_storage(
            19_000
        );
        assertEq(result.length, 19_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_11_000_randoms()
        public
    {
        instance.setRandoms(randoms_11_000);
        uint256[] memory result = instance.transformRandoms_result_to_storage(
            11_000
        );
        assertEq(result.length, 11_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_5_000_randoms()
        public
    {
        instance.setRandoms(randoms_5_000);
        uint256[] memory result = instance.transformRandoms_result_to_storage(
            5_000
        );
        assertEq(result.length, 5_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_2_300_randoms()
        public
    {
        instance.setRandoms(randoms_2_300);
        uint256[] memory result = instance.transformRandoms_result_to_storage(
            2_300
        );
        assertEq(result.length, 2_300);
    }

    function test_transformRandomsToMatchRange_result_to_storage_834_randoms()
        public
    {
        instance.setRandoms(randoms_834);
        uint256[] memory result = instance.transformRandoms_result_to_storage(
            834
        );
        assertEq(result.length, 834);
    }

    function test_transformRandomsToMatchRange_result_to_storage_124_randoms()
        public
    {
        instance.setRandoms(randoms_124);
        uint256[] memory result = instance.transformRandoms_result_to_storage(
            124
        );
        assertEq(result.length, 124);
    }

    function test_transformRandomsToMatchRange_result_to_storage_75_randoms()
        public
    {
        instance.setRandoms(randoms_75);
        uint256[] memory result = instance.transformRandoms_result_to_storage(
            75
        );
        assertEq(result.length, 75);
    }

    /*//////////////////////////////////////////////////////////////
                                 YUL
    //////////////////////////////////////////////////////////////*/
    function test_transformRandomsToMatchRange_result_to_storage_Yul_27_000_randoms()
        public
    {
        instance.setRandoms(randoms_27_000);
        uint256[] memory result = instance
            .YUL_transformRandoms_result_to_storage(27_000);
        assertEq(result.length, 27_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_Yul_22_000_randoms()
        public
    {
        instance.setRandoms(randoms_22_000);
        uint256[] memory result = instance
            .YUL_transformRandoms_result_to_storage(27_000);
        assertEq(result.length, 27_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_Yul_19_000_randoms()
        public
    {
        instance.setRandoms(randoms_19_000);
        uint256[] memory result = instance
            .YUL_transformRandoms_result_to_storage(19_000);
        assertEq(result.length, 19_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_Yul_11_000_randoms()
        public
    {
        instance.setRandoms(randoms_11_000);
        uint256[] memory result = instance
            .YUL_transformRandoms_result_to_storage(11_000);
        assertEq(result.length, 11_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_Yul_5_000_randoms()
        public
    {
        instance.setRandoms(randoms_5_000);
        uint256[] memory result = instance
            .YUL_transformRandoms_result_to_storage(5_000);
        assertEq(result.length, 5_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_Yul_2_300_randoms()
        public
    {
        instance.setRandoms(randoms_2_300);
        uint256[] memory result = instance
            .YUL_transformRandoms_result_to_storage(2_300);
        assertEq(result.length, 2_300);
    }

    function test_transformRandomsToMatchRange_result_to_storage_Yul_834_randoms()
        public
    {
        instance.setRandoms(randoms_834);
        uint256[] memory result = instance
            .YUL_transformRandoms_result_to_storage(834);
        assertEq(result.length, 834);
    }

    function test_transformRandomsToMatchRange_result_to_storage_Yul_124_randoms()
        public
    {
        instance.setRandoms(randoms_124);
        uint256[] memory result = instance
            .YUL_transformRandoms_result_to_storage(124);
        assertEq(result.length, 124);
    }

    function test_transformRandomsToMatchRange_result_to_storage_Yul_75_randoms()
        public
    {
        instance.setRandoms(randoms_75);
        uint256[] memory result = instance
            .YUL_transformRandoms_result_to_storage(75);
        assertEq(result.length, 75);
    }
}
