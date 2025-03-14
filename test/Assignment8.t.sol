// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Assignment8} from "../src/Assignment8.sol";
import {Vm} from "forge-std/Vm.sol";

contract Assignment8Test is Test {
    Assignment8 assignment;
    string public temporaryUriForTesting =
        "https://azure-yearning-shrew-339.mypinata.cloud/ipfs/bafkreifo3hg2hnig5ojay3tonmf6un3qlxqjienffsmpkq5cfpept2fake";

    function setUp() public {
        address owner = makeAddr("owner");
        vm.prank(owner);
        assignment = new Assignment8("pupg", "pup");

        vm.startPrank(owner);
    }

    function testMintNFTByOwner() public {
        address owner = makeAddr("owner");

        assignment.mintNFT(temporaryUriForTesting);

        uint256 tokenId = 0;
        assertEq(assignment.ownerOf(tokenId), owner, "Owner of token ID 0 should be the test address");
    }

   function testMintNFTByNonOwner() public {
    address nonOwner = makeAddr("nonOwner");

    vm.startPrank(nonOwner);  // Start acting as nonOwner
    vm.expectRevert();        // Expect revert before calling mintNFT
    assignment.mintNFT(temporaryUriForTesting);
    vm.stopPrank();           // Stop acting as nonOwner
}

}
