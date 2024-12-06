// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IToken.sol";

contract TokenB is IToken{

    uint256 constant private OWNER_BALANCE = 1000 * 10 ** 18;
    mapping (address => uint256) balances;
    mapping (address => mapping(address => uint256)) allowances; // Allower -> Allowee -> Amount

    constructor() {
        balances[msg.sender] = OWNER_BALANCE;
    }

    function transfer(address _recipient, uint256 _amount) external override {
        require(_recipient != address(0), "TRANSFER_TO_ZERO");
        require(balances[msg.sender] >= _amount, "INSUFFICENT_BALANCE");

        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;

        emit Transfer(msg.sender, _recipient, _amount);
    }

    function transferFrom(address _from, address _to, uint256 _amount) external override {
        require(_to != address(0), "TRANSFER_TO_ZERO");
        require(allowances[_from][msg.sender] >= _amount, "INSUFFICENT_ALLOWANCE");
        require(balances[_from] >= _amount, "INSUFFICENT_BALANCE");

        allowances[_from][msg.sender] -= _amount;
        balances[_to] += _amount;
        balances[_from] -= _amount;
    }


    function increaseAllowance(address _recipient, uint256 _amount) external {
        require(_recipient != address(0), "AUTHORIZE_TO_ZERO");

        allowances[msg.sender][_recipient] += _amount;
    }

    function decreaseAllowance(address _recipient, uint256 _amount) external {
        require(_recipient != address(0), "AUTHORIZE_TO_ZERO");

        allowances[msg.sender][_recipient] -= _amount;
    }

    function balanceOf(address user) external view override returns(uint256) {
        return balances[user];
    }

}