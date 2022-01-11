pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokensIds; // When a token is minted it will ++ the id;
    address contractAddress;

    constructor(address commerceAddress) ERC721("Commerce Token", "NFT") {
        contractAddress = commerceAddress;
    }
    function createToken (string memory TokenURI) public returns (uint){
        _tokensIds.increment();
        uint256 newItemId = _tokensIds.current();

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI)
        return newItemId; //I'm returning it just for the sake of the front-end
    }
    
}
