//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleMsgSender {
    address public someAddress;

    function updateAddress() public {
        someAddress = msg.sender;
    }
}