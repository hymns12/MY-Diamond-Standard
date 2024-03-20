// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

struct StakingAppStorage {
    
 mapping(address => uint) public balanceOf;

 uint totalSupply;

 uint rewardIndex;
  
 uint private constant MULTIPLIER = 1e18;

 mapping(address => uint) private rewardIndexOf;

 mapping(address => uint) private earned;  

}