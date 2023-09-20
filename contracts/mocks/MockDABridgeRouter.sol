// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract MockDABridgeRouter {
    mapping(uint32 => bytes32) public roots;

    function set(uint32 blockNumber, bytes32 root) external {
        roots[blockNumber] = root;
    }
}
