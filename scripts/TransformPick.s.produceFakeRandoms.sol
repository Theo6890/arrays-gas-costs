// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {TransformPick} from "../src/TransformPick.sol";

// forge script scripts/TransformPick.s.produceFakeRandoms.sol:TransformPick_produceFakeRandoms --rpc-url $MUMBAI_RPC --broadcast -vvvv
contract TransformPick_produceFakeRandoms is Script {
    function run() external {
        ///@dev automatic load from .env file
        string memory SEED = vm.envString("SEED");
        uint256 privateKey = vm.deriveKey(SEED, 0); // address at index 0
        vm.startBroadcast(privateKey);

        TransformPick transform = TransformPick(
            0xBffEaf52DB22A9D73fd2882975b446e8fE8f60dc
        );

        transform.produceFakeRandoms(1_000);

        vm.stopBroadcast();
    }
}
