// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {TransformPick} from "../src/TransformPick.sol";

/**
* @dev forge script scripts/TransformPick.s.deploy.sol:TransformPick_deploy --rpc-url $MUMBAI_RPC --broadcast --verify -vvvv --optimize --optimizer-runs 20000 -w
*
* @dev If verification fails:
* forge verify-contract \
    --chain 80001 \
    --num-of-optimizations 20000 \
    --compiler-version v0.8.13+commit.abaa5c0e \
    --watch 0x8994007ba2e02248225997454e734430265e5045 src/TransformPick.sol:TransformPick $POLYGON_KEY
*/
contract TransformPick_deploy is Script {
    function run() external {
        ///@dev Configure .env file
        string memory SEED = vm.envString("SEED");
        uint256 privateKey = vm.deriveKey(SEED, 0); // address at index 0
        vm.startBroadcast(privateKey);

        TransformPick transform = new TransformPick();

        vm.stopBroadcast();
    }
}
