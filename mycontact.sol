// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;
contract Mycontract{
    string public mystring = "Hello World";
    
    function updateOurString(string memory _myString) public {
    mystring = _myString; // Corrected variable name
   }
}