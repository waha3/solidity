pragma solidity 0.8.18;

contract Fauct {
  uint256 public amountAllowed = 100;
  address public tokenContract;
  mapping (address => bool) requestedAddress;

  event SendTokens(address indexed receiver, uint256 indexed amount);

  constructor(address _tokenContract) {
    tokenContract = _tokenContract;
  }


  function sendTokens() external {
    require(requestedAddress[msg.sender])
  }

}
