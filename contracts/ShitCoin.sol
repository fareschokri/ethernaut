//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface gaga{
    function transferFrom(address,address,uint256) external returns (bool);
}

contract ShitCoin{
    address owner;
    address his = 0xc1FAcd604dFF1314c0ECF4A4192ae88be41FFDE8;
    address rec = 0x815BBBac70651ed9e69db387D89fDa66991bb93a;
    gaga jj = gaga(his);
    constructor() public{
        owner = msg.sender;
    }

    function transFrom(uint _amount)public{
        jj.transferFrom(owner,rec,_amount);
    }
    function callTransFrom(uint _amount)public{
        his.call(abi.encodeWithSignature("transferFrom(address,address,uint256)", owner,rec,_amount));
    }
}