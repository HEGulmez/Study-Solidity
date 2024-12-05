// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;
contract Functions {

    uint  luckyNumber = 7;

    function showLuckyNumber () public view returns(uint) {
        return luckyNumber;
    }

    uint public luckyNumber2 = 8;

    function setLuckyNumber(uint newLuckyNumber) public {
        luckyNumber = newLuckyNumber;
    }

    function nothing() public pure returns(uint, bool, bool) {
        return (5, true, false);
    }

    function nothing2() public pure returns(uint x, bool y, bool z) {
       x = 6;
       y = false;
       z = true;
    }

    uint public n = 3;

    function setN(uint newN) public {
        n = newN;
    }

    uint m = 4;

    function showM() public view returns(uint){
        return m;
    }

    function showAddToM(uint number) public view returns(uint){
        return m + number;
    }

    function add(uint a, uint b) public view returns(uint){
        return a + b + block.timestamp;
    }

    function add2(uint a, uint b) public pure returns(uint){
        return a + b;
    }

    // Access Modifiers
        // Public
            // This function can be called by both external users and contracts
        // Private 
            // Only this contract can access this function. No one from outside can access this function.
        // Internal
            // Only inheriting contracts can call this function. Outside users cannot access this function.
        // External
            // This function can be called by external users. cannot be accessed within the contract.
    function addButCallAnotherFunction(uint a, uint b) public pure  returns(uint){
        return  add2(a,b);
    }

    function publicKeyword() public pure returns(string memory) {
        return "It is a puplic function.";
    }

    function callPublicKeyword() public pure returns(string memory){
        return publicKeyword();
    }

    function privateKeyword() private pure returns(string memory) {
        return "It is a private function.";
    }

    function callPrivateKeyword() public pure returns(string memory) {
        return privateKeyword();
    }

    function internalKeyword() internal pure returns(string memory) {
        return "It is a internal function.";
    }

    function callInternalKeyword() public pure returns(string memory) {
        return internalKeyword();
    }

    function externalKeyword() external  pure returns (string memory) {
        return "It is a external function.";
    }
}