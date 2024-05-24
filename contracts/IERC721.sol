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

  function safeTransferFrom(
    address from,
    address to,
    uint256 tokenId,
    bytes calldata data
  ) external;

  function safeTransferFrom(address from, address to, uint256 tokenId) external;

  function transferFrom(address from, address to, uint256 tokenId) external;

  function approve(address to, uint256 tokenId) external;

  function setApproveForAll(address operator, bool approved) external;

  function getApproved(
    uint256 tokenId
  ) external view returns (address operator);

  function isApprovedForAll(
    address owner,
    address operater
  ) external view returns (bool);
}
