// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import "./IERC721.sol";

interface IERC721Metadata is IERC721 {
  function name() external view returns (string memory);

  function symbol() external view returns (string memory);

  function tokenUrl(uint256 tokenId) external view returns (string memory);
}
