//SPDX-License-Identifier:MIT
pragma solidity ^0.6.0;

contract Solver {
    fallback () external returns(bytes){
        assembly{
            return(0x42,0x20)
        }
    }
}