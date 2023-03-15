// SPDX-License-Identifier: MIT

// Only allow compiler versions from 0.7.0 to (not including) 0.9.0
pragma solidity >=0.7.0 <0.9.0;

contract ToyShop {

    // State variables
    address public owner;
    bool shopIsOpen;
    mapping (address => uint) legoStock;
    mapping (address => uint) avengersStock;
    mapping (address => uint) marioStock;
    mapping (address => uint) barbieStock;
    mapping (address => uint) carStock;

    // On creation...
    constructor () {
        // Set the owner as the contract's deployer
        owner = msg.sender;

        // Set initial toy stocks
        legoStock[address(this)]  = 1000;
        avengersStock[address(this)]   = 1000;
        marioStock[address(this)]  = 1000;
        barbieStock[address(this)] = 1000;
        carStock[address(this)]    = 0;

        // The shop is initially closed
        shopIsOpen = true;
    }

    // Function to compare two strings
    function compareStrings(string memory a, string memory b) private pure returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked(b)));
    }

    // Let the owner restock the shop
    function restock(uint amount, string memory toyType) public {
        // Only the owner can restock!
        require(msg.sender == owner, "Only the owner can restock the machine!");

        // Refill the stock based on the type passed in
        if (compareStrings(toyType, "lego")) {
            legoStock[address(this)] += amount;
        } else if (compareStrings(toyType, "avengers")) {
            avengersStock[address(this)] += amount;
        } else if (compareStrings(toyType, "mario")) {
            marioStock[address(this)] += amount;
        } else if (compareStrings(toyType, "barbie")) {
            barbieStock[address(this)] += amount;
        } else if (compareStrings(toyType, "all")) {
            legoStock[address(this)] += amount;
            avengersStock[address(this)] += amount;
            marioStock[address(this)] += amount;
            barbieStock[address(this)] += amount;
        }
    }

    // Let the owner open and close the shop
    function openOrCloseShop() public returns (string memory) {
        if (shopIsOpen) {
            shopIsOpen = false;
            return "Shop is now closed.";
        } else {
            shopIsOpen = true;
            return "Shop is now open.";
        }
    }

    // Purchase a toy from the shop
    function purchase(uint amount, string memory toyType) public payable {
        require(shopIsOpen == true, "The shop is closed and you may not buy toys.");
        require(msg.value >= amount * 1 ether, "You must pay at least 1 ETH per toy arrangement!");

        // Sell a toy arrangement based on type asked
        if (compareStrings(toyType, "lego")) {
            legoStock[address(this)] -= amount;
            legoStock[msg.sender] += amount;
        } else if (compareStrings(toyType, "avengers")) {
            avengersStock[address(this)] -= amount;
            avengersStock[msg.sender] += amount;
        } else if (compareStrings(toyType, "mario")) {
            marioStock[address(this)] -= amount;
            marioStock[msg.sender] += amount;
        } else if (compareStrings(toyType, "barbie")) {
            barbieStock[address(this)] -= amount;
            barbieStock[msg.sender] += amount;
        } else if (compareStrings(toyType, "bouquet")) {
            legoStock[address(this)] -= amount;
            avengersStock[address(this)] -= amount;
            marioStock[address(this)] -= amount;
            barbieStock[address(this)] -= amount;

            carStock[msg.sender] += amount;
        }
    }

    // Get stock of a specific type of toy
    function getStock(string memory toyType) public view returns (uint) {
        // Get stock of a toy based on the type passed in
        if (compareStrings(toyType, "lego")) {
            return legoStock[address(this)];
        } else if (compareStrings(toyType, "avengers")) {
            return avengersStock[address(this)];
        } else if (compareStrings(toyType, "mario")) {
            return marioStock[address(this)];
        } else if (compareStrings(toyType, "barbie")) {
            return barbieStock[address(this)];
        } else {
            return 0;
        }
    }
}