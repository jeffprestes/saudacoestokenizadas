// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract SaudacoesTokenizadas is ERC721, Pausable, Ownable, ERC721Burnable {
    using Counters for Counters.Counter;

    Counters.Counter public _tokenIdCounter;
    string public storedBaseUrl;

    constructor() ERC721("Saudacoes Tokenizadas BR", "SDTKBR") {
        safeMint();
        storedBaseUrl = "https://jeffprestes.github.io/saudacoestokenizadas/nft/metadata/saudacao.json";
    }

    function _baseURI() internal view override returns (string memory) {
        return storedBaseUrl;
    }    

    function changeBaseURI(string memory _newBaseURI) external onlyOwner returns (bool) {
        storedBaseUrl = _newBaseURI;
        return true;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function safeMint() public {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(msg.sender, tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        return _baseURI();
    }

    // Soulbounded tokens

    function transferFrom(address from, address to, uint256 tokenId) public virtual override { 
        require(1>2, "This token is soul bound to his owner's account");
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public virtual override { 
        require(1>2, "This token is soul bound to his owner's account");
    }

}


