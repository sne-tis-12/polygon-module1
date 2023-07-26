// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "erc721a/contracts/ERC721A.sol";

contract MetaToken is ERC721A {
    
    address private owner;
    string[] private prompts = [
        "Spider portrayed as spider man",
        "Fox as the Flash, digital art, lightning-filled backdrop",
        "Elephant as the Hulk, cartoon, cityscape background",
        "Tiger as Wolverine from X-Men, digital art, forest setting",
        "Werewolf as a Vampire with rain of fire in the background"
    ];

    constructor() ERC721A("MetaToken", "MTN") {
        owner = msg.sender;
    }


    function _baseURI() internal view override returns (string memory) {
        return "QmaAZn3Dn1rK137bUzBvomn4uabGgWkNQejbTFny6jU4rz/";
    }

    function promptDescription(uint id) public view returns(string memory) {
        if (id > prompts.length || id < 0) {
            return "Invalid ID";
        }
        return prompts[id];
    }

    function mint(address reciever, uint256 quantity) public {
        require(msg.sender == owner, "Only Owner can mint tokens");
        _safeMint(reciever, quantity); 
    }
}