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
    function test_transformRandomsToMatchRange_result_to_memory_50_000()
        public
    {
        instance.transformRandoms_result_to_memory(50_000);
    }

    function test_transformRandomsToMatchRange_result_to_memory_30_000()
        public
    {
        instance.transformRandoms_result_to_memory(30_000);
    }

    function test_transformRandomsToMatchRange_result_to_memory_20_000()
        public
    {
        instance.transformRandoms_result_to_memory(20_000);
    }

    function test_transformRandomsToMatchRange_result_to_memory_10_000()
        public
    {
        instance.transformRandoms_result_to_memory(10_000);
    }

    function test_transformRandomsToMatchRange_result_to_memory_5_000()
        public
    {
        instance.transformRandoms_result_to_memory(5_000);
    }

    function test_transformRandomsToMatchRange_result_to_memory_1_000()
        public
    {
        instance.transformRandoms_result_to_memory(1_000);
    }

    function test_transformRandomsToMatchRange_result_to_memory_500() public {
        instance.transformRandoms_result_to_memory(500);
    }

    /*//////////////////////////////////////////////////////////////
                                 YUL
    //////////////////////////////////////////////////////////////*/
    function test_transformRandomsToMatchRange_result_to_memory_Yul_50_000()
        public
    {
        instance.YUL_transformRandoms_result_to_memory(50_000);
    }

    function test_transformRandomsToMatchRange_result_to_memory_Yul_30_000()
        public
    {
        instance.YUL_transformRandoms_result_to_memory(30_000);
    }

    function test_transformRandomsToMatchRange_result_to_memory_Yul_20_000()
        public
    {
        instance.YUL_transformRandoms_result_to_memory(20_000);
    }

    function test_transformRandomsToMatchRange_result_to_memory_Yul_10_000()
        public
    {
        instance.YUL_transformRandoms_result_to_memory(10_000);
    }

    function test_transformRandomsToMatchRange_result_to_memory_Yul_5_000()
        public
    {
        instance.YUL_transformRandoms_result_to_memory(5_000);
    }

    function test_transformRandomsToMatchRange_result_to_memory_Yul_1_000()
        public
    {
        instance.YUL_transformRandoms_result_to_memory(1_000);
    }

    function test_transformRandomsToMatchRange_result_to_memory_Yul_500()
        public
    {
        instance.YUL_transformRandoms_result_to_memory(500);
    }
}
