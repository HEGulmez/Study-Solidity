// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract Vault {

    address public owner;
    uint256 public balance;

    constructor(address _owner) {
        owner = _owner;
    }

    fallback() external payable {
        balance += msg.value;
    }

    receive() external payable { 
        balance += msg.value;
    }

    function getBalance() external view returns (uint256) {
        return balance;
    }

    function deposit() external payable {
        balance += msg.value;
    }

    function withdraw(uint256 _amount) external {
        require(msg.sender == owner, "You are not authorized");
        balance -= _amount;
        payable(owner).transfer(_amount);
    }
}