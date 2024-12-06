// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IToken {

    // "override" is required in functions.
    function transferFrom(address _from, address _to, uint256 _amount) external;
    function transfer(address _to, uint256 _amount) external;
    function balanceOf(address _user) external view returns(uint256);

    // "override" is not required in events.
    event Transfer(address indexed _from, address indexed _to,  uint256 _amount);
}