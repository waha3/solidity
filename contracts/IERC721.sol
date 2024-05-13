// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import "./IERC165.sol";

interface IERC721 is IERC165 {
  event Transfer(
    address indexed from,
    address indexed to,
    uint256 indexed tokenId
  );

  event Approval(
    address indexed owner,
    address indexed approved,
    uint256 indexed tokenId
  );

  event ApprovalForAll(
    address indexed owner,
    address indexed operator,
    bool indexed approved
  );
}
