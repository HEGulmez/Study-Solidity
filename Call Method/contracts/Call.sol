// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Test {

    uint256 public total = 0;
    uint256 public receiveCalled = 0;
    string public incrementer;

    receive() external payable { 
        receiveCalled += 1;
        total += msg.value;
        
    } 

    function increment(uint256 _amount, string memory _incrementer) external returns(uint256) {
        total += _amount;
        incrementer = _incrementer;

        return total;
    } 
}

contract Caller {
    
    function testCall(address _contract, uint256 _amount, string memory _incrementer) external returns(bool, uint256) {
        (bool success, bytes memory res) = _contract.call(abi.encodeWithSignature("increment(uint256,string)", _amount, _incrementer)); // Incorrect function calls trigger "fallback".
        
        require(success, "Function call failed");
        
        uint256 _total = abi.decode(res, (uint256)); 

        return (success, _total);
    }

    function payToReceive (address _contract) external payable {
        (bool success,) = _contract.call{value: msg.value}("");

        if(!success) revert();
    }
}