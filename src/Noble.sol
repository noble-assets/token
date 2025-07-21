/*
 * Copyright 2025 NASD Inc. All rights reserved.
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

/**
 * @title  Noble
 * @author John Letey <john@noble.xyz>
 * @notice ERC20 Noble Token.
 */
contract Noble is ERC20 {
    uint256 private constant INITIAL_SUPPLY = 1_000_000_000;

    /**
     * @notice Deploys the Noble token with initial supply minted to deployer.
     * @dev Initializes the ERC20 token with name "Noble" and symbol "NOBLE".
     *      Mints 1 billion tokens (1,000,000,000) to the contract deployer.
     *      The initial supply is adjusted for the token's decimal places (18 decimals).
     */
    constructor() ERC20("Noble", "NOBLE") {
        _mint(msg.sender, INITIAL_SUPPLY * 10 ** decimals());
    }

    /**
     * @notice Burns the caller's token allocation in preparation for the Noble AppLayer launch.
     * @dev This function burns the entire balance of the caller, reducing the total supply.
     *      It emits a Transfer event with the zero address as the recipient, which can be
     *      verified when creating the genesis file for the Noble AppLayer launch.
     * @custom:security Only the token holder can burn their own tokens.
     */
    function burn() public {
        uint256 balance = balanceOf(msg.sender);
        _burn(msg.sender, balance);
    }
}
