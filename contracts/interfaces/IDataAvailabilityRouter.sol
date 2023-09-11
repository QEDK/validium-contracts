// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

interface IDataAvailabilityRouter {
    function roots(uint32 blockNumber) external view returns (bytes32 root);
}
