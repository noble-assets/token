// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {AuctionNoble} from "../src/AuctionNoble.sol";

/// @title DeployAuctionNoble
/// @notice Deploys the NobleBurner and AuctionNoble contracts.
contract DeployAuctionNoble is Script {
    function run() external returns (AuctionNoble auctionNoble) {
        address owner = vm.envAddress("OWNER");
        vm.startBroadcast();

        auctionNoble = new AuctionNoble(owner);
        console.log("AuctionNoble deployed at:", address(auctionNoble));

        vm.stopBroadcast();
    }
}
