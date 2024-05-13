// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

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
    address to,
    uint256 amount
  ) external override returns (bool) {
    balanceOf[msg.sender] -= amount;
    balanceOf[to] += amount;
    emit Transfer(msg.sender, to, amount);
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
    uint256 amount
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

  function mint(uint256 amount) external {
    balanceOf[msg.sender] += amount;
    totalSupply += amount;
    emit Transfer(address(0), msg.sender, amount);
  }
}
