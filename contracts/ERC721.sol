// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import "./IERC165.sol";
import "./IERC721.sol";
import "./IERC721Receiver.sol";
import "./IERC721Metadata.sol";
import "./String.sol";

contract ERC721 is IERC721, IERC721Receiver {
  constructor() {}

  // function _checkOnERC721Received(
  //   address from,
  //   address to,
  //   uint256 tokenid,
  //   bytes memory data
  // ) private returns (bool) {
  //   if (to)
  // }

  using Strings for uint256;

  string public override name;
  string public override symbol;

  mapping(uint256 => address) private _owners;
  mapping(address => uint256) private _balances;
}
