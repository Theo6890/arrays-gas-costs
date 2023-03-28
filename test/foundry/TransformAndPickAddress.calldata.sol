// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Strings} from "openzeppelin-contracts/utils/Strings.sol";

import "forge-std/Test.sol";

import {TransformAndPickAddress} from "../../src/TransformAndPickAddress.sol";

contract TransformAndPickAddressTest is Test {
    TransformAndPickAddress public instance;
    address[] addresses_50_000;
    address[] addresses_40_000;
    address[] addresses_35_000;
    address[] addresses_30_000;
    address[] addresses_20_000;
    address[] addresses_10_000;
    address[] addresses_5_000;
    address[] addresses_1_000;
    address[] addresses_500;

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
        instance = new TransformAndPickAddress();

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

            if (i < 27_000) randoms_27_000.push(12489031409234 + i);
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
                                 YUL
    //////////////////////////////////////////////////////////////*/
    function test_transformAndPick_result_to_calldata_Yul_50_000_participants()
        public
    {
        instance.setRandoms(randoms_27_000);

        address[] memory result = instance
            .YUL_transformAndPick_parameterIn_calldata(
                addresses_50_000,
                27_000
            );
        assertEq(result.length, 27_000);
    }

    function test_transformAndPick_result_to_calldata_Yul_40_000_participants()
        public
    {
        instance.setRandoms(randoms_22_000);

        address[] memory result = instance
            .YUL_transformAndPick_parameterIn_calldata(
                addresses_40_000,
                22_000
            );
        assertEq(result.length, 22_000);
    }

    function test_transformAndPick_result_to_calldata_Yul_35_000_participants()
        public
    {
        instance.setRandoms(randoms_19_000);

        address[] memory result = instance
            .YUL_transformAndPick_parameterIn_calldata(
                addresses_35_000,
                19_000
            );
        assertEq(result.length, 19_000);
    }

    function test_transformAndPick_result_to_calldata_Yul_30_000_participants()
        public
    {
        instance.setRandoms(randoms_11_000);

        address[] memory result = instance
            .YUL_transformAndPick_parameterIn_calldata(
                addresses_30_000,
                11_000
            );
        assertEq(result.length, 11_000);
    }

    function test_transformAndPick_result_to_calldata_Yul_20_000_participants()
        public
    {
        instance.setRandoms(randoms_5_000);

        address[] memory result = instance
            .YUL_transformAndPick_parameterIn_calldata(
                addresses_20_000,
                5_000
            );
        assertEq(result.length, 5_000);
    }

    function test_transformAndPick_result_to_calldata_Yul_10_000_participants()
        public
    {
        instance.setRandoms(randoms_2_300);

        address[] memory result = instance
            .YUL_transformAndPick_parameterIn_calldata(
                addresses_10_000,
                2_300
            );
        assertEq(result.length, 2_300);
    }

    function test_transformAndPick_result_to_calldata_Yul_5_000_participants()
        public
    {
        instance.setRandoms(randoms_834);

        address[] memory result = instance
            .YUL_transformAndPick_parameterIn_calldata(addresses_5_000, 834);
        assertEq(result.length, 834);
    }

    function test_transformAndPick_result_to_calldata_Yul_1_000_participants()
        public
    {
        instance.setRandoms(randoms_124);

        address[] memory result = instance
            .YUL_transformAndPick_parameterIn_calldata(addresses_1_000, 124);
        assertEq(result.length, 124);
    }

    function test_transformAndPick_result_to_calldata_Yul_500_participants()
        public
    {
        instance.setRandoms(randoms_75);

        address[] memory result = instance
            .YUL_transformAndPick_parameterIn_calldata(addresses_500, 75);
        assertEq(result.length, 75);
    }
}
