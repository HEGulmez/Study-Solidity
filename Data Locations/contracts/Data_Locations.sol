// SPDX-License-Identifier: MIT
pragma solidity 0.8.11;


contract DataLocations {

    uint256 myVal; //storage
    mapping (address => uint256) balances; // storage

    string myName = "Emre"; // storage

    function func(
        uint256 paramUInt /*memory*/,
        string memory paramString /*We must specify where it will be kept. calldata -> read only, memory -> read and write*/
    ) external pure { 
        paramString = "";
        paramUInt = 0;
    }
}

struct Student {
    uint8 age;
    uint16 score;
    string name;
}

contract School {

    uint256 totalStudents = 0; // storage
    mapping (uint256 => Student) students; // storage

    function addStudent(string calldata _name, uint8 _age, uint16 _score) external {
        uint256 currentID = totalStudents++;
        students[currentID] = Student(_age, _score, _name);
    }

    function changeStudentInfoStorage(uint256 _id, 
    string calldata _newName, 
    uint8 _newAge, 
    uint16 _newScore
    ) external {
        Student storage currentStudent = students[_id];

        currentStudent.name = _newName;
        currentStudent.age = _newAge;
        currentStudent.score = _newScore;
    }

    function changeStudentInfoMemory(uint256 _id, 
    string calldata _newName, 
    uint8 _newAge, 
    uint16 _newScore
    ) external view { // It wants "view" because there will be no changes due to the fact that we are using "memory".
        Student memory currentStudent = students[_id];

        currentStudent.name = _newName;
        currentStudent.age = _newAge;
        currentStudent.score = _newScore;
    }

    function getStundentName(uint256 _id) external view  returns (string memory) {
        return students[_id].name;
    }
}