// SPDX-License-Identifier: MIT

pragma solidity ^0.8.30;

contract AttendanceTracker{
    string public studentName;
    uint public rollNumber;
    bool public isPresent;

    function markAttendance(string memory _name, uint _roll) public {
        studentName =_name;
        rollNumber = _roll;

        //Conditional logic
        if (_roll > 0 && _roll <=100) {
            isPresent = true;
        } else {
            isPresent = false;
        }

    }
    function getAttendance() public view returns (string memory, uint,bool){
        return (studentName,rollNumber,isPresent);
    }
    //count present student in a fixed-size class
    function countPresent(uint totalStudents) public pure returns ( uint){
        uint count = 0;
        for (uint i =1; i <= totalStudents; i++) {
            count += 1;
        }
        return count;
     }
     event AttendanceMarked(address indexed StudentAddress, string name,bool present);

     function markAttendanceWithEvent(string memory _name, uint _roll) public {
        bool presentStatus;

        if (_roll > 0 && _roll <= 100){
            presentStatus = true;
        }else{
            presentStatus = false;
        }
        emit AttendanceMarked(msg.sender, _name, presentStatus);
     }
}