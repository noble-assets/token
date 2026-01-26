// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {AuctionNoble} from "../src/AuctionNoble.sol";
import {NobleBurner} from "../src/NobleBurner.sol";

/// @title DeployAuctionNoble
/// @notice Deploys the NobleBurner and AuctionNoble contracts.
contract DeployAuctionNoble is Script {
    function run() external returns (AuctionNoble auctionNoble, NobleBurner burner) {
        address owner = vm.envAddress("OWNER");
        vm.startBroadcast();

        burner = new NobleBurner();
        console.log("NobleBurner deployed at:", address(burner));

        auctionNoble = new AuctionNoble(owner, address(burner));
        console.log("AuctionNoble deployed at:", address(auctionNoble));

        vm.stopBroadcast();
    }
}
