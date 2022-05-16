// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/**
Building out the minting function:
    a. nft to point to an address 0xdfae..34df
    b. keep track of the token ids 1,2,3,...
    c. keep track of token owner address to token ids
    d. keep track of how many tokens an owner address has
    e. create an event that emits 
        a transfer log - contract address, where it is being minted to, the id
*/

contract ERC721 {

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    // mapping for token id to the owner
    mapping(uint256 => address) private _tokenOwner;

    // mapping from owner to number of owned tokens
    mapping(address => uint256) private _ownedTokensCount;

    function _exists(uint256 tokenId) internal view returns (bool) {
        address tokenOwner = _tokenOwner[tokenId];
        return tokenOwner != address(0);
    }

    function _mint(address tokenOwner, uint256 tokenId) internal virtual {
        require(tokenOwner != address(0), "ERC721: minting to the zero address");
        require(!_exists(tokenId), "This token already minted");
        
        _tokenOwner[tokenId] = tokenOwner;
        _ownedTokensCount[tokenOwner] += 1;

        emit Transfer(address(0), tokenOwner, tokenId);
    }   

    /// @notice Count all NFTs assigned to an owner
    /// @dev NFTs assigned to the zero address are considered invalid, and this
    ///  function throws for queries about the zero address.
    /// @param _owner An address for whom to query the balance
    /// @return The number of NFTs owned by `_owner`, possibly zero
    function balanceOf(address _owner) external view returns (uint256) {
        require(_owner != address(0), "Error - Queries about the zero address");
        return _ownedTokensCount[_owner];
    }
    
    /// @notice Find the owner of an NFT
    /// @dev NFTs assigned to zero address are considered invalid, and queries
    ///  about them do throw.
    /// @param _tokenId The identifier for an NFT
    /// @return The address of the owner of the NFT
    function ownerOf(uint256 _tokenId) external view returns (address) {
        require(_exists(_tokenId), "Error - token doesn't exist");
        return _tokenOwner[_tokenId];
    }
}