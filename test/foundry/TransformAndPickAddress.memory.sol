// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Strings} from "openzeppelin-contracts/utils/Strings.sol";

import "forge-std/Test.sol";

import {TransformAndPickAddress} from "../../src/TransformAndPickAddress.sol";

contract TransformAndPickAddressTest is Test {
    TransformAndPickAddress public instance;
    address[] addresses_50_000;
    address[] addresses_45_000;
    address[] addresses_30_000;
    address[] addresses_20_000;
    address[] addresses_10_000;
    address[] addresses_5_000;
    address[] addresses_1_000;
    address[] addresses_500;

    function setUp() public {
        instance = new TransformAndPickAddress();

        for (uint256 i; i < 5_000; ++i) {
            addresses_50_000.push(
                makeAddr(string.concat("test", Strings.toString(i)))
            );
            if (i < 45_000) addresses_45_000.push(addresses_50_000[i]);
            if (i < 30_000) addresses_30_000.push(addresses_50_000[i]);
            if (i < 20_000) addresses_20_000.push(addresses_50_000[i]);
            if (i < 10_000) addresses_10_000.push(addresses_50_000[i]);
            if (i < 5_000) addresses_5_000.push(addresses_50_000[i]);
            if (i < 1_000) addresses_1_000.push(addresses_50_000[i]);
            if (i < 500) addresses_500.push(addresses_50_000[i]);
        }
    }

    /*//////////////////////////////////////////////////////////////
                            SOLIDITY
    //////////////////////////////////////////////////////////////*/
    function test_transformAndPick_result_to_memory_50_000() public {
        instance.transformAndPick_result_to_memory(addresses_50_000);
    }

    function test_transformAndPick_result_to_memory_45_000() public {
        instance.transformAndPick_result_to_memory(addresses_45_000);
    }

    function test_transformAndPick_result_to_memory_30_000() public {
        instance.transformAndPick_result_to_memory(addresses_30_000);
    }

    function test_transformAndPick_result_to_memory_20_000() public {
        instance.transformAndPick_result_to_memory(addresses_20_000);
    }

    function test_transformAndPick_result_to_memory_10_000() public {
        instance.transformAndPick_result_to_memory(addresses_10_000);
    }

    function test_transformAndPick_result_to_memory_5_000() public {
        instance.transformAndPick_result_to_memory(addresses_5_000);
    }

    function test_transformAndPick_result_to_memory_1_000() public {
        instance.transformAndPick_result_to_memory(addresses_500);
    }

    function test_transformAndPick_result_to_memory_500() public {
        instance.transformAndPick_result_to_memory(addresses_500);
    }

    /*//////////////////////////////////////////////////////////////
                                 YUL
    //////////////////////////////////////////////////////////////*/
    function test_transformAndPick_result_to_memory_Yul_50_000() public {
        instance.YUL_transformAndPick_result_to_memory(addresses_50_000);
    }

    function test_transformAndPick_result_to_memory_Yul_45_000() public {
        instance.YUL_transformAndPick_result_to_memory(addresses_45_000);
    }

    function test_transformAndPick_result_to_memory_Yul_30_000() public {
        instance.YUL_transformAndPick_result_to_memory(addresses_30_000);
    }

    function test_transformAndPick_result_to_memory_Yul_20_000() public {
        instance.YUL_transformAndPick_result_to_memory(addresses_20_000);
    }

    function test_transformAndPick_result_to_memory_Yul_10_000() public {
        instance.YUL_transformAndPick_result_to_memory(addresses_10_000);
    }

    function test_transformAndPick_result_to_memory_Yul_5_000() public {
        instance.YUL_transformAndPick_result_to_memory(addresses_5_000);
    }

    function test_transformAndPick_result_to_memory_Yul_1_000() public {
        instance.YUL_transformAndPick_result_to_memory(addresses_500);
    }

    function test_transformAndPick_result_to_memory_Yul_500() public {
        instance.YUL_transformAndPick_result_to_memory(addresses_500);
    }
}
