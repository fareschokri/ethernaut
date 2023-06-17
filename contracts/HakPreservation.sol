//SPDX-License-Identifier:MIT
pragma solidity ^0.6.0;

contract HakPreservation{
    
    uint storedTime;
    address lolo;
    address owner;
    address his = 0xF63Dca1D5926f77172DEF0ede3ed85cAd53b0562;

    constructor() public{
    }

    function addrtouint(address _addr) public view returns(uint){
        return uint(_addr);
    }

    function setTime(uint _time) public {
    storedTime = _time;
    lolo = 0x57315Bf019F60b29d7BAcb7003EC002aAFA3b127;
    owner = 0x57315Bf019F60b29d7BAcb7003EC002aAFA3b127;
  }


    fallback() external payable{}
    receive() external payable{}

}