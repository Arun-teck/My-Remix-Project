// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

contract VisibilityBug {
    uint private balance = 0;

    address public owner;
constructor() { owner = msg.sender;}

function withdrawAll() public{  // or `internal`
    require(msg.sender == owner, "Only owner!");
    payable(msg.sender).transfer(balance);
    balance = 0;
}
}