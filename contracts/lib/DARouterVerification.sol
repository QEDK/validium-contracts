// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "../interfaces/IDataAvailabilityRouter.sol";
import "./Merkle.sol";

contract DARouterVerification is OwnableUpgradeable {
    using Merkle for bytes32;

    mapping(bytes32 => uint256) public isBatchPosted;

    IDataAvailabilityRouter public router;

    error DataRootNotFound();
    error BatchAlreadyPosted();
    error InvalidDAProof();

    constructor(IDataAvailabilityRouter _router) {
        router = _router;
    }

    function setRouter(
        IDataAvailabilityRouter _router
    ) external onlyOwner {
        router = _router;
    }

    function _checkDataRootMembership(
        uint32 blockNumber,
        bytes32[] calldata proof,
        uint256 width, // number of leaves
        uint256 index,
        bytes32 leaf
    ) internal {
        bytes32 rootHash = router.roots(blockNumber);
        // if root hash is 0, block does not have a root (yet)
        if (rootHash == bytes32(0)) {
            revert DataRootNotFound();
        }
        if (isBatchPosted[leaf] != 0) {
            revert BatchAlreadyPosted();
        }
        if (!leaf.checkMembership(rootHash, proof, width, index)) {
            revert InvalidDAProof();
        }
        isBatchPosted[leaf] = 1;
    }
}
