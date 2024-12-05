//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Constructor {

    string public tokenName;
    uint public totalSupply;
    uint public constant number = 10;
    address public immutable owner;
    
    constructor(string memory name, uint num){
        tokenName = name;
        totalSupply = num;
        owner = msg.sender;
    }

    // constructor(){}
        //  It is run at first and only once.
    // constant
        //  It takes a value when defined and its value cannot be changed again.
    // immutable 
        //  Its value is assigned in the constructor function and its value cannot be changed again.

 
}