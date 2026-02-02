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

/// @title INoble
/// @notice Interface for the NOBLE token's burn functionality.
/// @dev The NOBLE token allows any holder to burn their own balance by calling burn().
interface INoble {
    /// @notice Burns the caller's entire NOBLE token balance.
    /// @dev Permanently removes the caller's tokens from circulation.
    function burn() external;
}
