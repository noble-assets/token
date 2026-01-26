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

/// @title INobleBurner
/// @notice Interface for the NobleBurner contract that burns NOBLE tokens sent to it.
/// @dev The NobleBurner acts as an intermediary to burn exact amounts of NOBLE tokens,
/// since NOBLE's burn() function burns the caller's entire balance.
interface INobleBurner {
    /// @notice Burns all NOBLE tokens held by the burner contract.
    /// @dev Callers should transfer the exact amount to burn before calling this function.
    function doBurn() external;
}
