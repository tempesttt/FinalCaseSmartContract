// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Example {
    // Mapping to store user data
    mapping(address => User) public users;

    // Struct to define user data
    struct User {
        string name;
        uint age;
        uint[] pastTransactions;
        address userAddress;
    }

    // Event to emit user data
    event NewUser(address userAddress, string name, uint age);

    // Constructor to create initial user data
    constructor() {
    users[msg.sender] = User("Alice", 25, new uint[](10), msg.sender);
    }


    // Function to update user data
    function updateUser(string memory _name, uint _age) public {
        require(msg.sender == users[msg.sender].userAddress, "Access denied.");
        users[msg.sender].name = _name;
        users[msg.sender].age = _age;
        emit NewUser(msg.sender, _name, _age);
    }
    // Function to add user data
    function addTransaction(uint _transaction) public {
        require(msg.sender == users[msg.sender].userAddress, "Access denied.");
        users[msg.sender].pastTransactions.push(_transaction);
    }
    // Modifier to check user age
    modifier onlyAdults() {
        require(users[msg.sender].age >= 18, "Access denied. Must be 18 or older.");
        _;
    }
    // Function to perform an action only for adults
    function doAdultAction() onlyAdults public {
        // Action only available for users 18 or older
    }
}
