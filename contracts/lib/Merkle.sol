// SPDX-License-Identifier: Apache-2.0
// Modified from https://github.com/QEDK/solidity-misc/blob/master/contracts/Merkle.sol
pragma solidity ^0.8.22;

library Merkle {
    function checkMembership(
        bytes32 leaf,
        bytes32 root,
        bytes32[] calldata proof,
        uint256 width, // number of leaves
        uint256 index
    ) internal pure returns (bool isMember) {
        assembly ("memory-safe") {
            if proof.length {
                let end := add(proof.offset, shl(5, proof.length))
                let i := proof.offset

                for {} 1 {} {
                    let leafSlot := shl(5, and(0x1, index))
                    if eq(add(index, 1), width) {
                        leafSlot := 0x20
                    }
                    mstore(leafSlot, leaf)
                    mstore(xor(leafSlot, 32), calldataload(i))
                    leaf := keccak256(0, 64)
                    index := shr(1, index)
                    i := add(i, 32)
                    width := add(shr(1, sub(width, 1)), 1)
                    if iszero(lt(i, end)) {
                        break
                    }
                }
            }
            // checks if the calculated root matches the expected root
            // then, check if index was zeroed while calculating proof, else an invalid index was provided
            isMember := and(eq(leaf, root), iszero(index))
        }
    }
}
