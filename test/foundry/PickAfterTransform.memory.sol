// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Strings} from "openzeppelin-contracts/utils/Strings.sol";

import "forge-std/Test.sol";

import {PickAfterTransform} from "../../src/PickAfterTransform.sol";

contract PickAfterTransformTest is Test {
    PickAfterTransform public instance;
    address[] public addresses_50_000;
    address[] public addresses_40_000;
    address[] public addresses_35_000;
    address[] public addresses_30_000;
    address[] public addresses_20_000;
    address[] public addresses_10_000;
    address[] public addresses_5_000;
    address[] public addresses_1_000;
    address[] public addresses_500;

    uint256[] public randoms_27_000;
    uint256[] public randoms_22_000;
    uint256[] public randoms_19_000;
    uint256[] public randoms_11_000;
    uint256[] public randoms_5_000;
    uint256[] public randoms_2_300;
    uint256[] public randoms_834;
    uint256[] public randoms_124;
    uint256[] public randoms_75;

    function setUp() public {
        instance = new PickAfterTransform();

        for (uint256 i; i < 50_000; ++i) {
            addresses_50_000.push(
                makeAddr(string.concat("test", Strings.toString(i)))
            );
            if (i < 40_000) addresses_40_000.push(addresses_50_000[i]);
            if (i < 35_000) addresses_35_000.push(addresses_50_000[i]);
            if (i < 30_000) addresses_30_000.push(addresses_50_000[i]);
            if (i < 20_000) addresses_20_000.push(addresses_50_000[i]);
            if (i < 10_000) addresses_10_000.push(addresses_50_000[i]);
            if (i < 5_000) addresses_5_000.push(addresses_50_000[i]);
            if (i < 1_000) addresses_1_000.push(addresses_50_000[i]);
            if (i < 500) addresses_500.push(addresses_50_000[i]);

            if (i < 27_000) randoms_27_000.push((12489031409234 + i) % 27_000);
            if (i < 22_000) randoms_27_000.push((12489031409234 + i) % 22_000);
            if (i < 19_000) randoms_27_000.push((12489031409234 + i) % 19_000);
            if (i < 11_000) randoms_27_000.push((12489031409234 + i) % 11_000);
            if (i < 5_000) randoms_27_000.push((12489031409234 + i) % 5_000);
            if (i < 2_300) randoms_27_000.push((12489031409234 + i) % 2_300);
            if (i < 834) randoms_27_000.push((12489031409234 + i) % 834);
            if (i < 124) randoms_27_000.push((12489031409234 + i) % 124);
            if (i < 75) randoms_27_000.push((12489031409234 + i) % 75);
        }
    }

    /*//////////////////////////////////////////////////////////////
                                 YUL
    //////////////////////////////////////////////////////////////*/
    function test_pickAfterTransform_result_to_memory_Yul_50_000() public {
        instance.setTransformedRands(randoms_27_000);

        address[] memory result = instance
            .YUL_pickAfterTransform_result_to_memory(addresses_50_000, 27_000);
        assertEq(result.length, 27_000);
    }

    function test_pickAfterTransform_result_to_memory_Yul_40_000() public {
        instance.setTransformedRands(randoms_22_000);

        address[] memory result = instance
            .YUL_pickAfterTransform_result_to_memory(addresses_40_000, 22_000);
        assertEq(result.length, 22_000);
    }

    function test_pickAfterTransform_result_to_memory_Yul_35_000() public {
        instance.setTransformedRands(randoms_19_000);

        address[] memory result = instance
            .YUL_pickAfterTransform_result_to_memory(addresses_35_000, 19_000);
        assertEq(result.length, 19_000);
    }

    function test_pickAfterTransform_result_to_memory_Yul_30_000() public {
        instance.setTransformedRands(randoms_11_000);

        address[] memory result = instance
            .YUL_pickAfterTransform_result_to_memory(addresses_30_000, 11_000);
        assertEq(result.length, 11_000);
    }

    function test_pickAfterTransform_result_to_memory_Yul_20_000() public {
        instance.setTransformedRands(randoms_5_000);

        address[] memory result = instance
            .YUL_pickAfterTransform_result_to_memory(addresses_20_000, 5_000);
        assertEq(result.length, 5_000);
    }

    function test_pickAfterTransform_result_to_memory_Yul_10_000() public {
        instance.setTransformedRands(randoms_2_300);

        address[] memory result = instance
            .YUL_pickAfterTransform_result_to_memory(addresses_10_000, 2_300);
        assertEq(result.length, 2_300);
    }

    function test_pickAfterTransform_result_to_memory_Yul_5_000() public {
        instance.setTransformedRands(randoms_834);

        address[] memory result = instance
            .YUL_pickAfterTransform_result_to_memory(addresses_5_000, 834);
        assertEq(result.length, 834);
    }

    function test_pickAfterTransform_result_to_memory_Yul_1_000() public {
        instance.setTransformedRands(randoms_124);

        address[] memory result = instance
            .YUL_pickAfterTransform_result_to_memory(addresses_1_000, 124);
        assertEq(result.length, 124);
    }

    function test_pickAfterTransform_result_to_memory_Yul_500() public {
        instance.setTransformedRands(randoms_75);

        address[] memory result = instance
            .YUL_pickAfterTransform_result_to_memory(addresses_500, 75);
        assertEq(result.length, 75);
    }
}
