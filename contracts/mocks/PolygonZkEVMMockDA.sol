// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.22;

import "../PolygonZkEVM.sol";

contract PolygonZkEVMMockDA is PolygonZkEVM {
    /**
     * @param _globalExitRootManager Global exit root manager address
     * @param _matic MATIC token address
     * @param _rollupVerifier Rollup verifier address
     * @param _bridgeAddress Bridge address
     * @param _chainID L2 chainID
     * @param _forkID Fork Id
     */
    constructor(
        IPolygonZkEVMGlobalExitRoot _globalExitRootManager,
        IERC20Upgradeable _matic,
        IVerifierRollup _rollupVerifier,
        IPolygonZkEVMBridge _bridgeAddress,
        uint64 _chainID,
        uint64 _forkID
    )  PolygonZkEVM(
            _globalExitRootManager,
            _matic,
            _rollupVerifier,
            _bridgeAddress,
            _chainID,
            _forkID
        ) {
    }

    function _checkDataRootMembership(
        uint32,
        bytes32[] calldata,
        uint256, // number of leaves
        uint256,
        bytes32
    ) internal virtual override {
        return;
    }
}
