// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract ERC20 {
    uint totalSupply;
    mapping(address => uint256) balances;
    //DS which will have approved coins of a particular owner for a spender approved[owner][spender].
    mapping(address => mapping(address => uint)) approved;

    constructor(){
    }

    function totalSupply() public view returns (uint256) {
        return totalSupply;
    }
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
    function transfer(address _to, uint256 _value) public returns (bool success) {
        if(balances[msg.sender] >= _value && _value >0 ) {
            balances[_to] += _value;
            balances[msg.sender] -= _value;
            return true;
        } else {
            return false;
        }

    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        if (balances[_from] >=  _value) {
            balances[_to] += _value;
            balances[_from] -= _value;
        }
    }
    function approve(address _spender, uint256 _value) public returns (bool success) {
        if (balances[msg.sender] >=  _value) {
            approved[msg.sender][_spender] = _value;
            return true;
        } else {
            return false;
        }
    }
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {

    }

    function mint(uint numberOfCoins) {
        balances[msg.sender] += numberOfCoins;
        totalSupply += numberOfCoins;
    }
    function getBalances() returns(uint256) {
        return balances[msg.sender];
    }
}
