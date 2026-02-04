/*
 * Copyright 2026 NASD Inc. All rights reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
pragma solidity 0.8.20;

import {ERC20} from "@openzeppelin/token/ERC20/ERC20.sol";
import {IERC20} from "@openzeppelin/token/ERC20/IERC20.sol";
import {Ownable} from "@openzeppelin/access/Ownable.sol";
import {INobleBurner} from "./interface/INobleBurner.sol";
import {NobleBurner} from "./NobleBurner.sol";
import {SafeERC20} from "@openzeppelin/token/ERC20/utils/SafeERC20.sol";

/// @title AuctionNoble
/// @notice A wrapper token for NOBLE used in the Uniswap CCA.
/// @dev This contract wraps NOBLE tokens 1:1 for use in the auction. When AuctionNoble
/// tokens are transferred, they are burned and the underlying NOBLE is sent to the burner
/// contract for permanent removal from circulation.
contract AuctionNoble is ERC20, Ownable {
    using SafeERC20 for IERC20;

    error NothingToMint();
    error AlreadyMintedToAuction();
    error NothingToRecover();
    error InvalidRecipient();

    event Burned(address indexed from, uint256 amount);

    /// @notice The address of the underlying NOBLE token.
    address immutable NOBLE = 0xe995e5A3A4BF15498246D7620CA39f7409397326;

    /// @notice The burner contract that handles NOBLE token burns.
    INobleBurner immutable BURNER;

    /// @notice Flag indicating whether tokens have been minted to the auction contract.
    bool public mintedToAuction;

    /// @notice Initializes the AuctionNoble wrapper token.
    /// @param _owner The address that will own this contract and can call admin functions.
    constructor(address _owner) ERC20("Noble Voucher", "NOBLEV") Ownable(_owner) {
        BURNER = new NobleBurner(NOBLE);
    }

    /// @notice Mints AuctionNoble tokens to the auction contract based on deposited NOBLE balance.
    /// @dev Can only be called once. The contract must hold NOBLE tokens before calling.
    /// @param auction The address of the auction contract to receive the minted tokens.
    function mintToAuction(address auction) external onlyOwner {
        uint256 balance = IERC20(NOBLE).balanceOf(address(this));
        if (balance == 0) revert NothingToMint();
        if (mintedToAuction) revert AlreadyMintedToAuction();
        mintedToAuction = true;
        _mint(auction, balance);
    }

    /// @notice Returns the total supply of the underlying NOBLE token.
    /// @dev Overrides ERC20's totalSupply to reflect the NOBLE token's total supply,
    /// providing visibility into the overall NOBLE circulation.
    /// @return The total supply of NOBLE tokens.
    function totalSupply() public view override returns (uint256) {
        return IERC20(NOBLE).totalSupply();
    }

    /// @notice Internal transfer hook that burns NOBLE on any transfer.
    /// @dev Overrides ERC20's _update to intercept transfers. Mints, burns, and transfers
    /// to this contract proceed normally. All other transfers burn the AuctionNoble and
    /// send the underlying NOBLE to the burner for permanent destruction.
    /// @param from The address tokens are transferred from.
    /// @param to The address tokens are transferred to.
    /// @param amount The amount of tokens being transferred.
    function _update(address from, address to, uint256 amount) internal override {
        if (from == address(0) || to == address(0) || to == address(this)) {
            super._update(from, to, amount);
            return;
        }
        _burn(from, amount);
        IERC20(NOBLE).safeTransfer(address(BURNER), amount);
        BURNER.doBurn();

        emit Burned(from, amount);
    }

    /// @notice Recovers unsold AuctionNoble tokens held by this contract.
    /// @dev Burns the AuctionNoble and returns the underlying NOBLE to the specified address.
    /// Used to reclaim tokens that weren't sold in the auction.
    /// @param to The address to receive the recovered NOBLE tokens.
    function recoverUnsold(address to) external onlyOwner {
        if (to == address(0)) revert InvalidRecipient();
        uint256 held = balanceOf(address(this));
        if (held == 0) revert NothingToRecover();
        _burn(address(this), held);
        IERC20(NOBLE).safeTransfer(to, held);
    }
}
