// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Math {

    function plus(uint x, uint y) public pure returns(uint) {
        return x + y;
    }

    function minus(uint x, uint y) public pure returns(uint) {
        return x - y;
    }

    function multi(uint x, uint y) public pure returns(uint) {
        return x * y;
    }

    function divide(uint x, uint y) public pure returns(uint) {
        require(y != 0, "The divisor cannot be zero");

        return x / y;
    }

    function min(uint x, uint y) public pure returns(uint) {
        if(x <= y) {
            return x;
        } else {
            return y;
        }
    }

    function max(uint x, uint y) public pure returns(uint) {
        if(x >= y) {
            return x;
        } else {
            return y;
        }
    }
}

library Search {
    function indexOf(uint[] memory list, uint data) public pure returns(uint) {
        for (uint i = 0; i < list.length; i++){
            if (list[i] == data) {
                return i;
            }
        }
        return list.length;
    }
}

library Human {
    struct Person {
        uint age;
    }

    function birthday(Person storage _person) public {
        _person.age++;
    }

    function showAge(Person storage _person) public view returns (uint) {
        return _person.age;
    }
}

contract Library {

    using Math for uint; // The library can assign to a variable type
    using Search for uint[];

    mapping (uint => Human.Person) people;

    function trial(uint x, uint y) public pure returns(uint) {
        return Math.plus(x,y);
    }

    function trial2(uint x, uint y) public pure returns(uint) {
        return x.minus(y);
    }

    function trial3(uint x, uint y) public pure returns(uint) {
        return Math.multi(x,y);
    }

    function trial4(uint x, uint y) public pure returns(uint) {
        return Math.divide(x,y);
    }

    function trial5(uint x, uint y) public pure returns(uint) {
        return Math.min(x,y);
    }

    function trial6(uint x, uint y) public pure returns(uint) {
        return Math.max(x,y);
    }

    function trial7(uint[] memory x, uint y) public pure returns(uint) {
        return Search.indexOf(x,y);
    }

    function trial8(uint[] memory x, uint y) public pure returns(uint) {
        return x.indexOf(y);
    }

    function newYear() public {
        Human.birthday(people[0]);
    }

    function show() public view returns(uint) {
        return Human.showAge(people[0]);
    }
}