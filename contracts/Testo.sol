//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;



contract Testo{
    address payable wa = 0x57315Bf019F60b29d7BAcb7003EC002aAFA3b127;
    
    function callTransFrom(address _his, string memory _proto)public{
        _his.call(abi.encodeWithSignature(_proto,wa));
        
    }

    function delegatecallTransFrom(address _his, string memory _proto)public{
        _his.delegatecall(abi.encodeWithSignature(_proto,wa));
        
    }

    fallback() external payable{}
    receive() external payable{}
}