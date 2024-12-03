// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract MessageContract {
    // State variable to store the message
    string public message;

    // Constructor to set the initial message
    constructor(string memory _initialMessage) {
        message = _initialMessage;
    }

    // Public function to update the message
    function updateMessage(string memory _newMessage) public {
        message = _newMessage;
    }
}
