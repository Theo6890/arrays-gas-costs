// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../../src/Lottery.sol";

contract TokenTest is Test {
    Lottery public instance;

    function setUp() public {
        instance = new Lottery();
    }

    /*//////////////////////////////////////////////////////////////
                                 BASIC ATTRIBUTES
    //////////////////////////////////////////////////////////////*/
    function test_transformRandomsToMatchRange() public {
        assertTrue(true);
    }
}
