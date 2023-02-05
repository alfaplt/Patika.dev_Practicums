// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

contract EtherSender {
    address public owner;
    uint256 public balance = 5;

    constructor() {
        owner = msg.sender;
    }

    receive() payable external {
        balance += msg.value;
    }

    function withdraw(uint amount, address payable destAddr) public {
        require(amount <= balance, "insufficient funds !");
        destAddr.transfer(amount);
        balance -= amount;
    }
}
