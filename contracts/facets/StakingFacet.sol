// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import './ERC20Token1.sol';
import './IERC20.sol';

contract SackingIERC20 {

   StakingAppStorage internal SAS;


    constructor(address _stackingToken, address _rewardToken) {
        SAS.stackingToken = IERC20(_stackingToken);
        SAS.rewardToken = IERC20(_rewardToken);

    }

    function updataRewardIndex(uint reward) external {
        SAS.rewardToken.transferForm(msg.sender, address(this), reward);
        SAS.rewardIndex += (reward * MULTIPLIER) / totalSupply; 
    }

    function _calculateRewards(address account) private view returns(uint) {
         SAS.shares = balanceOf[account];
        return SAS.(shares * (rewardIndex- rewardIndexOf[account])) / MULTIPLIER;
    }

    function _calculateRewardsEarned(address account) external view returns (uint) {
        return SAS.earned[account] + _calculateRewards(account);
    }

    function _updataReward(address account) private {
        SAS.earned[account] += _calculateRewards(account);
        SAS.rewardIndexOf[account] = rewardIndex;
    }

    function stake (uint amount) external {
        _updataReward(msg.sender);

        SAS.balanceOf[msg.sender] += amount;
        SAS.totalSupply += amount;

        SAS.stackingToken.transferForm(msg.sender, address(this), amount);

    }


    function unStake (uint amount) external {
         _updataReward(msg.sender);

        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;

        stackingToken.transfer(msg.sender,  amount);
    }

    function claim() external returns(uint) {
         _updataReward(msg.sender);

         uint reward = earned[msg.sender];
         if (reward > 0) {
            earned[msg.sender] = 0;
            rewardToken.transfer(msg.sender, reward);
            
        }

        return reward;
    }

       

}