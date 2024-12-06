// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EthSender {
    function _send(address payable _to, uint256 _amount) private {
        _to.transfer(_amount);
    }

    function sendWithStrategy(address strategyAddress) external {
        // (bool success, bytes memory data) = strategyAddress.call(abi.encodeWithSignature("getAddressAndAmount()")); // hard way
        (address payable _to, uint256 _amount) = IStrategy(strategyAddress).getAddressAndAmount();
        _send(_to, _amount);
    }

    receive() external payable { }
}

abstract contract Strategy {
    function getAddressAndAmount() external view virtual returns(address payable, uint256);
}

interface IStrategy {
    function getAddressAndAmount() external view returns(address payable, uint256);
}

contract AddressStrategy1 {
    uint256 constant ETHER_AMOUNT = 0.1 ether;

    function getAddressAndAmount() external pure returns(address payable, uint256) {
        return (payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2), ETHER_AMOUNT);
    }
}

contract AddressStrategy2 {
    uint256 constant ETHER_AMOUNT = 0.1 ether;

    function getAddressAndAmount() external pure returns(address payable, uint256) {
        uint256 amount = ETHER_AMOUNT * 5;
        return (payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2), amount);
    }
}

contract AddressStrategy3 is Strategy {
    uint256 constant ETHER_AMOUNT = 0.1 ether;

    function getAddressAndAmount() external pure override returns(address payable, uint256) {
        uint256 amount = ETHER_AMOUNT * 5;
        return (payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2), amount);
    }
}