// SPDX-License-Identifier: agpl-3.0
pragma solidity 0.7.6;
pragma abicoder v2;


interface IKyberFairLaunch {

  /**
  * @dev Add a new lp to the pool. Can only be called by the admin.
  * @param _stakeToken: token to be staked to the pool
  * @param _startBlock: block where the reward starts
  * @param _endBlock: block where the reward ends
  * @param _rewardLockBps: percentage (in bps) of reward to be locked
  * @param _rewardPerBlock: amount of reward token per block for the pool
  * @param _withUpdate: whether to update all pools
  */
  function addPool(
    address _stakeToken,
    uint32 _startBlock,
    uint32 _endBlock,
    uint32 _rewardLockBps,
    uint128 _rewardPerBlock,
    bool _withUpdate
  ) external;

  /**
  * @dev Renew a pool with a new set of data, only when pool is not active.
  * @param _pid: pool id to be renew
  * @param _startBlock: block where the reward starts
  * @param _endBlock: block where the reward ends
  * @param _rewardLockBps: percentage (in bps) of reward to be locked
  * @param _rewardPerBlock: amount of reward token per block for the pool
  * @param _withUpdate: whether to update the pool
  */
  function renewPool(
    uint256 _pid,
    uint32 _startBlock,
    uint32 _endBlock,
    uint32 _rewardLockBps,
    uint128 _rewardPerBlock,
    bool _withUpdate
  ) external;

  /**
  * @dev Update a pool, allow to change end block, reward per block and lock bps
  * @param _pid: pool id to be renew
  * @param _endBlock: block where the reward ends
  * @param _rewardLockBps: percentage (in bps) of reward to be locked
  * @param _rewardPerBlock: amount of reward token per block for the pool
  * @param _withUpdate: whether to update the pool
  */
  function updatePool(
    uint256 _pid,
    uint32 _endBlock,
    uint32 _rewardLockBps,
    uint128 _rewardPerBlock,
    bool _withUpdate
  ) external;

  /**
  * @dev deposit to tokens to accumulate rewards
  * @param _pid: id of the pool
  * @param _amount: amount of stakeToken to be deposited
  */
  function deposit(uint256 _pid, uint256 _amount) external;

  /**
  * @dev withdraw token (of the sender) from pool, also harvest reward
  * @param _pid: id of the pool
  * @param _amount: amount of stakeToken to withdraw
  */
  function withdraw(uint256 _pid, uint256 _amount) external;

  /**
  * @dev withdraw all tokens (of the sender) from pool, also harvest reward
  * @param _pid: id of the pool
  */
  function withdrawAll(uint256 _pid) external;

  /**
  * @dev emergency withdrawal function to allow withdraw all deposited token (of the sender)
  *   without harvesting the reward
  * @param _pid: id of the pool
  */
  function emergencyWithdraw(uint256 _pid) external;

  /**
  * @dev harvest reward from pool for the sender
  * @param _pid: id of the pool
  */
  function harvest(uint256 _pid) external;

  /**
  * @dev harvest rewards from all pools for the sender
  */
  function harvestAll() external;

  /**
  * @dev update reward for one pool
  */
  function updatePoolRewards(uint256 _pid) external;

  /**
  * @dev return the total of pools that have been added
  */
  function poolLength() external view returns (uint256);

  /**
  * @dev get pending reward of a user from a pool, mostly for front-end
  * @param _pid: id of the pool
  * @param _user: user to check for pending rewards
  */
  function pendingReward(uint256 _pid, address _user) external view returns (uint256);
}