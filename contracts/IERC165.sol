// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

interface IERC165 {
  function supportInterface(bytes4 interfaceId) external view returns (bool);
}
