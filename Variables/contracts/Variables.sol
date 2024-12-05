// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

contract Variables {
    // Fixed-Size Types
        bool isTrue; // default = false

        // Type-name;   type-name = value;

        int number = 12; // default type -> int256 (-2^256 to 2^256)
        uint number2 = 12; // default type -> uint256 (0 to 2^256)

        address myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; //  20 byte

        bytes32 name1 = "Emre";

    // Dynamic-Size Types
        string name2 = "Emre";

        bytes name3 ="Emre3";

        uint[] array = [1, 2, 3, 4, 5];

        mapping(uint => address) list;

    // User Defined Value Types

        struct Human {
            uint ID;
            string name;
            uint age;
            address addresss;
        }
        /* Human identify

            mapping (uint => Human) list2;

            Human person1;
            person1.ID = 15324685246;
            person1.name = "Emre";
            person1.age = 20;
            person1.myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; */

            enum trafficLight {
                RED,
                Yellow,
                Green
            }

            // trafficLight.RED;

    // if(condition){}
    
    /* unit transformations(ether)
        1 wei = 1
        1 ether = 10^18 wei
        1 gwei = 10^9 wei   */
    
    /* unit transformations(time)
        1 seconds = 1
        1 minutes = 60 seconds
        1 hours = 60 minutes = 3600 seconds
        1 days = 24 hours
        1 weeks = 7 days
        etc.    */
    
    // state variables
    string public bestClub = "Genesis Codes";

    function show() public view returns(string memory){
        return bestClub;
    }

    // local variables
    function show2() public pure returns(uint){
        uint number3 = 17;
        return number3;
    }
    
    function show3() public view  returns (uint){
        // global variables
        return block.number;
        /*  block.difficulty;
            block.gaslimit;
            block.timestamp;
            msg.sender; etc.    */
        
        // return number3; i can't reach this variable in this area
    }
    
    
}