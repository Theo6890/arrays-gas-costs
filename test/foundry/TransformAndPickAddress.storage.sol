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

        for (uint256 i; i < 50_000; ++i) {
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
                                 YUL
    //////////////////////////////////////////////////////////////*/
    function test_transformAndPick_result_to_storage_Yul_50_000() public {
        address[] memory result = instance
            .YUL_transformAndPick_result_to_storage(addresses_50_000);
        assertEq(result.length, 50_000);
    }

    function test_transformAndPick_result_to_storage_Yul_45_000() public {
        address[] memory result = instance
            .YUL_transformAndPick_result_to_storage(addresses_45_000);
        assertEq(result.length, 45_000);
    }

    function test_transformAndPick_result_to_storage_Yul_30_000() public {
        address[] memory result = instance
            .YUL_transformAndPick_result_to_storage(addresses_30_000);
        assertEq(result.length, 30_000);
    }

    function test_transformAndPick_result_to_storage_Yul_20_000() public {
        address[] memory result = instance
            .YUL_transformAndPick_result_to_storage(addresses_20_000);
        assertEq(result.length, 20_000);
    }

    function test_transformAndPick_result_to_storage_Yul_10_000() public {
        address[] memory result = instance
            .YUL_transformAndPick_result_to_storage(addresses_10_000);
        assertEq(result.length, 10_000);
    }

    function test_transformAndPick_result_to_storage_Yul_5_000() public {
        address[] memory result = instance
            .YUL_transformAndPick_result_to_storage(addresses_5_000);
        assertEq(result.length, 5_000);
    }

    function test_transformAndPick_result_to_storage_Yul_1_000() public {
        address[] memory result = instance
            .YUL_transformAndPick_result_to_storage(addresses_1_000);
        assertEq(result.length, 1_000);
    }

    function test_transformAndPick_result_to_storage_Yul_500() public {
        address[] memory result = instance
            .YUL_transformAndPick_result_to_storage(addresses_500);
        assertEq(result.length, 500);
    }
}
