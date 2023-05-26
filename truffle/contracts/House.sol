// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract House is ERC721 {
    using Counters for Counters.Counter;

    Counters.Counter private _maisonIds;
    Counters.Counter private _soldHouses;

    struct Maison {
        string name;
        address owner;
        int256 posX;
        int256 posY;
        int256 posZ;
        uint256 sizeX;
        uint256 sizeY;
        uint256 sizeZ;
    } 

    uint public cost;
    uint public maxSupply;
    uint public totalSupply;

    Maison[] public maisons;
   
    constructor() ERC721("HouseToken", "HTKN") {
        cost = 0.0000000000000001 ether; // prix pour créer une maison
        maxSupply = 10; // maximum de maisons qui peuvent être créées
        totalSupply = 5; // maximum de maisons qu'un utilisateur peut posséder
        maisons.push(Maison("maison1",address(0x0),1,1,1,1,1,1));
        maisons.push(Maison("maison2",address(0x0),2,2,2,1,1,1));
        maisons.push(Maison("maison3",address(0x0),3,3,3,1,1,1));
        maisons.push(Maison("maison4",address(0x0),4,4,4,1,1,1));
        maisons.push(Maison("maison5",address(0x0),5,5,5,1,1,1));
        maisons.push(Maison("maison6",address(0x0),6,6,6,1,1,1));
    }

    function mint(string memory _name,int256 _posX,int256 _posY,int256 _posZ, uint256 _sizeX, uint256 _sizeY, uint256 _sizeZ) public payable {
        // require(ownerHouseCount[msg.sender] < totalSupply, "You have reached your max house allocation");
        // require(_soldHouses.current() < maxSupply, "Sale has ended");
        // require(msg.value >= cost, "Amount below cost");

        _maisonIds.increment();
        _soldHouses.increment();

        uint maisonId = _maisonIds.current();
        maisons.push(Maison(_name, msg.sender,_posX,_posY,_posZ,_sizeX,_sizeY,_sizeZ));
        _mint(msg.sender, maisonId);
    }
    function getHouses() public view returns (Maison[] memory){
        return maisons;
    }
}
