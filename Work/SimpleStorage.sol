// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SimpleStorage {
    // Private variable to store the favorite number
    uint256 private favoriteNumber;
    // Public dynamic array to store multiple favorite numbers
    uint256[] public favoriteNumbers;
    // Array of Person structs to store people's data
    Person[] public people;
    
    // Struct to store a person's name and favorite number
    struct Person {
        string name;
        uint256 favoriteNumber;
    }

    // Enum to manage contract states (Active or Inactive)
    enum ContractState { Active, Inactive }
    ContractState public state;

    // Function to set the favorite number
    function storeNumber(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // Public view function to return the favorite number
    function getFavoriteNumber() public view returns (uint256) {
        return favoriteNumber;
    }

    // Function to compare favoriteNumber with a given value
    function isGreaterThan(uint256 _value) public view returns (bool) {
        return favoriteNumber > _value;
    }

    // Function to sum numbers from 1 to favoriteNumber
    function sumToFavoriteNumber() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 1; i <= favoriteNumber; i++) {
            sum += i;
        }
        return sum;
    }

    // Internal function that returns a simple string
    function internalFunction() internal pure returns (string memory) {
        return "This is an internal function";
    }

    // Wrapper function to expose internalFunction
    function callInternalFunction() public view returns (string memory) {
        return internalFunction();
    }

    // External function that returns a string
    function externalFunction() external pure returns (string memory) {
        return "This is an external function";
    }

    // Public function that calls externalFunction using the this keyword
    function testExternalFunction() public view returns (string memory) {
        return this.externalFunction();
    }

    // Function to add a favorite number to the favoriteNumbers array
    function addFavoriteNumber(uint256 _number) public {
        favoriteNumbers.push(_number);
    }

    // Function to store a person's name and favorite number in the people array
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(Person(_name, _favoriteNumber));
    }

    // Function to set the contract state to active
    function activateContract() public {
        state = ContractState.Active;
    }

    // Function to set the contract state to inactive
    function deactivateContract() public {
        state = ContractState.Inactive;
    }

      // Function to check if the contract is currently active
    function isActive() public view returns (bool) {
        return state == ContractState.Active;
    }
}

