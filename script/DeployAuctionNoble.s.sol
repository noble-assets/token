// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {AuctionNoble} from "../src/AuctionNoble.sol";

/// @title DeployAuctionNoble
/// @notice Deploys the NobleBurner and AuctionNoble contracts.
contract DeployAuctionNoble is Script {
    function run() external returns (AuctionNoble auctionNoble) {
        vm.startBroadcast();

        auctionNoble = new AuctionNoble(msg.sender);
        console.log("AuctionNoble deployed at:", address(auctionNoble));

        vm.stopBroadcast();
    }
}
