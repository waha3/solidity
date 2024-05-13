// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

import "./IERC20.sol";

contract ERC20 is IERC20 {
  constructor(string memory _name, string memory _symbol) {
    name = _name;
    symbol = _symbol;
  }

  mapping(address => uint256) public override balanceOf;
  mapping(address => mapping(address => uint256)) public override allowance;

  uint256 public override totalSupply;
  string public name;
  string public symbol;

  uint8 public decimals = 18;

  function transfer(
    address recipoent,
    uint amount
  ) external override returns (bool) {
    balanceOf[msg.sender] -= amount;
    balanceOf[recipoent] += amount;
    emit Transfer(msg.sender, recipoent, amount);
    return true;
  }

  function approve(
    address sender,
    uint256 amount
  ) external override returns (bool) {
    allowance[msg.sender][sender] = amount;
    emit Approval(msg.sender, sender, amount);
    return true;
  }

  function transferFrom(
    address sender,
    address receipt,
    uint amount
  ) external override returns (bool) {
    if (allowance[sender][receipt] >= amount) {
      allowance[sender][receipt] -= amount;
    }

    if (balanceOf[sender] >= amount) {
      balanceOf[sender] -= amount;
    }

    balanceOf[receipt] += amount;
    emit Transfer(sender, receipt, amount);
    return true;
  }
}
