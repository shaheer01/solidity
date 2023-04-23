// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract MyContract {
    string value;
    enum State {waiting, active, ready};
    string public state;

    constructor(){
        value = "myValue";
        state = State.waiting;
    }
    //Instead of this you can make the line #5 as public i.e string public value and then you dont need the below function.
    function get() public view returns(string memory) {
        return value;
    }

    function set(string memory _value) public {
        value = _value;
    }

    function activate() public {
        state = State.active;
    }

    function isActive() public view  returns(bool){
        return state == State.active;
    }
}
