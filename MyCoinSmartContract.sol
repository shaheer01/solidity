// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// This contract will give the amount to the requester and check balance.
contract MyCoinSmartContract {
    //Whenever the contract is created by deployer, sender.msg is executed as constructor for the deployer.
    address deployer;
    mapping(address => uint256) balances;

    constructor() {
        deployer =  msg.sender;
    }

    //The function caller should be the deployer/owner of the contract to give the coin to the requester/receiver.
    function giveAmount (address requester, uint256 amount) public {
        if (msg.sender == deployer) {
            //Giving coin to the requester/receiver.
            balances[requester] += amount;
        } else {
            revert();
        }
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

}
