// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract Privacy {

  bool public locked = true;
  uint256 public ID = 1656414269;
  uint8 public flattening = 66;
  uint8 public denomination = 111;
  uint16 public awkwardness = uint16(1);
  bytes32[3] public data;
  bytes16 public giveit;
  constructor(bytes32[3] memory _data) public {
    data = _data;
    giveit = bytes16(data[2]);
  }
  
  function unlock(bytes16 _key) public {
    require(_key == bytes16(data[2]));
    locked = false;
  }
  }