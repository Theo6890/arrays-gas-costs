// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../../src/Transform.sol";

contract TransformTest is Test {
    Transform public instance;

    function setUp() public {
        instance = new Transform();
    }

    /*//////////////////////////////////////////////////////////////
                                 SOLIDITY
    //////////////////////////////////////////////////////////////*/
    function test_transformRandomsToMatchRange_result_to_storage_50_000()
        public
    {
        instance.transformRandoms_result_to_storage(50_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_45_000()
        public
    {
        instance.transformRandoms_result_to_storage(45_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_30_000()
        public
    {
        instance.transformRandoms_result_to_storage(30_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_20_000()
        public
    {
        instance.transformRandoms_result_to_storage(20_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_10_000()
        public
    {
        instance.transformRandoms_result_to_storage(10_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_5_000()
        public
    {
        instance.transformRandoms_result_to_storage(5_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_1_000()
        public
    {
        instance.transformRandoms_result_to_storage(1_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_500() public {
        instance.transformRandoms_result_to_storage(500);
    }

    /*//////////////////////////////////////////////////////////////
                                 YUL
    //////////////////////////////////////////////////////////////*/
    function test_transformRandomsToMatchRange_result_to_storage_Yul_50_000()
        public
    {
        instance.YUL_transformRandoms_result_to_storage(50_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_Yul_45_000()
        public
    {
        instance.YUL_transformRandoms_result_to_storage(45_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_Yul_30_000()
        public
    {
        instance.YUL_transformRandoms_result_to_storage(30_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_Yul_20_000()
        public
    {
        instance.YUL_transformRandoms_result_to_storage(20_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_Yul_10_000()
        public
    {
        instance.YUL_transformRandoms_result_to_storage(10_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_Yul_5_000()
        public
    {
        instance.YUL_transformRandoms_result_to_storage(5_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_Yul_1_000()
        public
    {
        instance.YUL_transformRandoms_result_to_storage(1_000);
    }

    function test_transformRandomsToMatchRange_result_to_storage_Yul_500()
        public
    {
        instance.YUL_transformRandoms_result_to_storage(500);
    }
}
