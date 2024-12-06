// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//virtual

contract Base {

    uint public x;
    uint public y;

    function setX(uint _x) virtual public {
        x = _x;
    }

    function setY(uint _y) public {
        y = _y;
    }
}
// override

contract Derived is Base {
    
    uint public z;

    function setZ(uint _z) public {
        z = _z;
    }

    function setX(uint _x) override public {
        x = _x + 2;
    }
}

contract Human {

    function sayHello() public pure virtual returns(string memory) {
        return "Welcome.";
    }
}

contract SuperHuman is Human {
    
    function sayHello() public pure override returns(string memory) {
        return "Welcome back.";
    }

    function welcomeMsg(bool isMember) public pure returns(string memory) {
        // return isMember ? sayHello() : Human.sayHello();
        return isMember ? sayHello() : super.sayHello();

    }
}

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Wallet is Ownable {

    constructor() Ownable(msg.sender) {}

    receive() external payable { }

    fallback() payable external { }

    function sendEther(address payable _to, uint _amount) public onlyOwner {
        _to.transfer(_amount);
    }

    function showBalance() public view returns(uint) {
        return address(this).balance;
    }
}