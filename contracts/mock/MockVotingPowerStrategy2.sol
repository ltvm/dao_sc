// SPDX-License-Identifier: MIT
pragma solidity 0.7.6;

contract MockVotingPowerStrategy2 {
  function validateProposalCreation(
    uint256, /*startTime*/
    uint256 /*endTime*/
  ) external pure returns (bool) {
    return true;
  }
}
