// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract Bank {

    mapping (address => uint) balances;

    function sendEtherToContract() payable external {
        balances[msg.sender] = msg.value;
    }

    function showBalance() external view returns(uint) {
        return balances[msg.sender];
    }

    function withdraw(address payable _to, uint amount) external {
       require(balances[msg.sender] >= amount, "Insufficient balance.");

       _to.transfer(amount);
       balances[msg.sender] -= amount;
    }

    function withdraw2(address payable _to, uint amount) external {
       _to.transfer(amount);
       balances[msg.sender] -= amount;
    }

    function withdraw3(address payable _to, uint amount) external returns(bool) {
       bool result = _to.send(amount);
       balances[msg.sender] -= amount;

       return result;
    }

    function withdraw4(address payable _to, uint amount) external returns(bool) {
       (bool sent,) = _to.call{value: amount}("");
       balances[msg.sender] -= amount;

       return sent;
    }

    // transfer()
        // If there is not enough balance in the contract, the transaction will be reverted.
    // send()
        // If the transaction has taken place, it outputs true, if it has not taken place, false.
    // call()
        // Returns two values. The first is "true" or "false". The second is "data".

    uint public receiveCount = 0;
    uint public fallbackCount = 0;

    receive() external payable {
        receiveCount += 1;
    }

    fallback() external payable { 
        fallbackCount += 1;
    }
}