//SPDX-License-Identifier:MIT
pragma solidity^0.8.0;


contract CallAlien
{

    address public owner;
    bool public contact;
    address _a = 0xB5FBa3266e1Ec6093a16b33dfd760D06D79C63D2;

    constructor(){
        owner = msg.sender;
        contact = false;
    }
    
    function  callfunc(string memory _func) public
    {
       (bool success,) = _a.call(abi.encodeWithSignature(_func));
                  require(success, "Call was not successful");
    }
    
    function  delegatecallfunc(string memory _func) public
    {
       (bool success,) = _a.delegatecall(abi.encodeWithSignature(_func));
                  require(success, "DDDDDCall was not successful");
    }
}