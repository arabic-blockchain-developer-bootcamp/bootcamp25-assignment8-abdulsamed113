// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Inherit from ERC721URIStorage instead of ERC721
contract Assignment8 is ERC721URIStorage, Ownable {
    uint256 private _tokenIdCounter;

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) Ownable(msg.sender) {}

    function mintNFT(string memory json_uri) external onlyOwner {
        _tokenIdCounter++; // Increment before using

        // Mint NFT
        _mint(msg.sender, _tokenIdCounter);

        // Set token URI
        _setTokenURI(_tokenIdCounter, json_uri);
    }
}
