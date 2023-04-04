// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/Test.sol";

import {Strings} from "openzeppelin-contracts/utils/Strings.sol";

import {TransformPick} from "../src/TransformPick.sol";

// forge script scripts/TransformPick.s.transformPick.sol:TransformPick_transformPick --rpc-url $MUMBAI_RPC --broadcast -vvvv
contract TransformPick_transformPick is Script, Test {
    function run() external {
        ///@dev automatic load from .env file
        string memory SEED = vm.envString("SEED");
        uint256 privateKey = vm.deriveKey(SEED, 0); // address at index 0
        vm.startBroadcast(privateKey);

        TransformPick transform = TransformPick(
            0x8994007BA2e02248225997454e734430265e5045
        );

        address[] memory addrs = new address[](1000);
        for (uint256 i = 0; i < 1000; ++i) {
            addrs[i] = makeAddr(string.concat("addr", Strings.toString(i)));
        }

        transform.transformRandomsAndPickWinners(addrs, 100);

        vm.stopBroadcast();
    }
}
