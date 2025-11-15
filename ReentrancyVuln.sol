// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract ReentrencyVuln {
    mapping(address => uint) public balances;

    function deposit() external payable{
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint amount = balances[msg.sender];
        require(amount > 0, "No balance");
        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
}