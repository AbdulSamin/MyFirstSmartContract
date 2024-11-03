// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SimpleStorage {
    // Persistent storage variable for favorite number
    uint256 private favoriteNumber;

    // Mapping to store favorite numbers by name
    mapping(string => uint256) private nameToFavoriteNumber;

    // Dynamic array to store multiple favorite numbers
    uint256[] public favoriteNumbers;

    // Struct to store a person's name and favorite number
    struct Person {
        string name;
        uint256 favoriteNumber;
    }

    // Array of Person structs to store people's data
    Person[] public people;

    // Event that logs when the favorite number is updated
    event NumberUpdated(uint256 newFavoriteNumber);

    // Enum to manage contract states
    enum ContractState { Active, Inactive }
    ContractState public contractState;

    // Modifier to check if contract is active
    modifier onlyIfActive() {
        require(contractState == ContractState.Active, "Contract is inactive");
        _;
    }

    // Function to set the favorite number and emit an event
    function storeNumber(uint256 _favoriteNumber) public onlyIfActive {
        favoriteNumber = _favoriteNumber;
        emit NumberUpdated(_favoriteNumber);
    }

    // Function to retrieve the favorite number
    function getFavoriteNumber() public view returns (uint256) {
        return favoriteNumber;
    }

    // Function to compare favorite number with a given value
    function isGreaterThan(uint256 _value) public view returns (bool) {
        return favoriteNumber > _value;
    }

    // Function to add numbers from 1 to favoriteNumber
    function sumToFavoriteNumber() public view returns (uint256 sum) {
        for (uint256 i = 1; i <= favoriteNumber; i++) {
            sum += i;
        }
    }

    // Function to add a person's name and favorite number to both array and mapping
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(Person(_name, _favoriteNumber));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // Function to retrieve a favorite number by name from the mapping
    function getFavoriteNumberByName(string memory _name) public view returns (uint256) {
        return nameToFavoriteNumber[_name];
    }

    // Function to add a favorite number to the array
    function addFavoriteNumber(uint256 _favoriteNumber) public {
        favoriteNumbers.push(_favoriteNumber);
    }

    // Function using a memory variable for temporary calculation
    function multiplyFavoriteNumber(uint256 multiplier) public view returns (uint256) {
        uint256 tempResult = favoriteNumber * multiplier; // memory variable
        return tempResult;
    }

    // Function using calldata parameter for read-only string processing
    function processStringData(string calldata _input) external pure returns (bytes32) {
        // Example of processing: return the keccak256 hash of the input
        return keccak256(abi.encodePacked(_input));
    }

    // Function to activate the contract
    function activateContract() public {
        contractState = ContractState.Active;
    }

    // Function to deactivate the contract
    function deactivateContract() public {
        contractState = ContractState.Inactive;
    }

    // Function to check if the contract is active
    function isActive() public view returns (bool) {
        return contractState == ContractState.Active;
    }
}
