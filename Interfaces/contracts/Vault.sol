// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IToken.sol";

contract Vault {

    mapping(address => mapping (IToken => uint256)) tokenBalances; // User -> Token -> Balance

    /* Without interfaces.

        address private immutable _tokenA;
        address private immutable _tokenB;

        constructor(address tokenA, address tokenB) {
            _tokenA = tokenA;
            _tokenB = tokenB;
        }

        function depositToken(address _tokenAddress, uint256 _amount) external {
            if(_tokenAddress == _tokenA)
                TokenA(_tokenAddress).transferWithAllowance(msg.sender, address(this), _amount);
            else if(_tokenAddress == _tokenB)
                TokenB(_tokenAddress).transferFrom(msg.sender, address(this), _amount);
            else
                revert("Invalid token");
        }

        function withdrawToken(address _tokenAddress, uint256 _amount) external {
            
        }

        function getBalanceOf(address _user, address _tokenAddress) external view returns(uint256) {
            if(_tokenAddress == _tokenA)
                return TokenA(_tokenAddress).getBalance(_user);
            else if(_tokenAddress == _tokenB)
                return TokenB(_tokenAddress).balanceOf(_user);
            else
                return 0;
        }

    */

    function depositToken(IToken _token, uint256 _amount) external {
        _token.transferFrom(msg.sender, address(this), _amount);
        tokenBalances[msg.sender][_token] += _amount;
    }

    function withdrawToken(IToken _token,uint256 _amount) external {
        tokenBalances[msg.sender][_token] -= _amount;
        _token.transfer(msg.sender, _amount);
    }

    function getBalanceOf(address _user, IToken _token) external view returns(uint256) {
        return _token.balanceOf(_user);
    }

}

