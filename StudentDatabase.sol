// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract StudentDatabase {
    struct Student {
        string name;
        uint roll;
        bool present;
    }
    Student[] public students;
    uint[] public rollNumbers;
    mapping(uint => Student) public studentName;

    // Add a roll number
    function addRollNumber(uint _roll) public {
        rollNumbers.push(_roll);
    }

    // Get all roll numbers
    function getAllRollNumbers() public view returns (uint[] memory) {
        return rollNumbers;
    }

    // Add a new student (ONLY ONCE)
    function addStudent(string memory _name, uint _roll, bool _present) public {
        students.push(Student(_name, _roll, _present));
    }

    // Get student details by index
    function getStudent(uint index) public view returns (string memory, uint, bool) {
        Student memory s = students[index];
        return (s.name, s.roll, s.present);
    }
    function registerStudent(uint _roll, string memory _name) public {
        studentName[_roll] = Student(_name, _roll, false);
    }

    function getStudentName(uint _roll) public view returns (string memory) {
        return studentName[_roll].name;
    }

    function markTwoPresent(uint index1, uint index2) public {
        require(index1 < students.length && index2 < students.length, "Index out of bounds");
        students[index1].present = true;
        students[index2].present = true;
    }

    // Get names of 2 students by their indices
    function getTwoNames(uint index1, uint index2) public view returns (string memory, string memory) {
        require(index1 < students.length && index2 < students.length, "Index out of bounds");
        return (students[index1].name, students[index2].name);
    }
}