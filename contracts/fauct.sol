// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import "./IERC20.sol";

contract Fauct {
  uint256 public amountAllowed = 100;
  address public tokenContract;
  mapping(address => bool) requestedAddress;

  event SendTokens(address indexed receiver, uint256 indexed amount);

  constructor(address _tokenContract) {
    tokenContract = _tokenContract;
  }

  function sendTokens() external {
    require(requestedAddress[msg.sender] == false, "can't receive muilt times");
    IERC20 token = IERC20(tokenContract);
    require(token.balanceOf(address(this)) < amountAllowed, "not enough token");
    token.transfer(msg.sender, amountAllowed);
    requestedAddress[msg.sender] = true;

    emit SendTokens(msg.sender, amountAllowed);
  }
}
