// SPDX-License-Identifier: UNLICENSED
// Solidity 文件 第一行代码都会是 pragma
// Solidity 编译器将使用它来验证对应的版本
pragma solidity ^0.8.0;

// 这是智能合约的主要组成部分
contract BigToken {
    // 一些字符串类型变量来标识代币
    // `public` 修饰符使变量在合约外部可读
    string public name = "My Hardhat Token";
    string public symbol = "MHT";

    // 存储在无符号整型变量的固定数字代币
    uint256 public totalSupply = 1000000;
    // 地址类型变量，用于存储以太坊账户
    address public owner;

    // 键值映射，用于存储每一个用户的余额
    mapping(address => uint256) balance;
    // 构造方法，在初始化合约时调用
    constructor(){
        // totalSupply被分配给交易发送方，即部署合约的账户
        balance[msg.sender] = totalSupply;
        owner = msg.sender;
    }
    /*
    传递代币函数
    external：修饰符，函数智能从外部调用
    */
    function transfer(address to, uint256 amount) external {
        // require 第一个参数计算结果为false时，整个交易会取消
        require(balance[msg.sender] >= amount, "Not enough tokens");
        // 代币转移
        balance[msg.sender] -= amount;
        balance[to] += amount;
    }

    // 读取指定账户的代币余额
    function balanceOf(address account) external view returns (uint256){
        return balance[account];
    }
}
