# ToyShop Smart Contract

This is a smart contract for a toy shop written in Solidity. The ToyShop smart contract has the following features:

An owner who can restock the shop, open or close the shop.
Different types of toys (Lego, Avengers, Mario, Barbie, Car) and their stock quantities.
Purchase of toys by the customers with a minimum amount of 1 ETH per toy arrangement.
Checking the stock of a specific type of toy.

## Requirements

This smart contract requires a Solidity compiler version greater than or equal to 0.7.0 and less than 0.9.0. The license for this smart contract is MIT.

## How to use

Deploy the smart contract to an Ethereum network.
Call the restock function to restock the toys of a specific type or all the toys. Only the owner can restock the toys.
Call the openOrCloseShop function to open or close the shop. Only the owner can open or close the shop.
Call the purchase function to purchase a toy arrangement by sending the required amount of ether. The minimum amount of ether required is 1 ETH per toy arrangement.
Call the getStock function to get the stock of a specific type of toy.

## Functions

### restock(uint amount, string memory toyType) public

The restock function is used by the owner to restock the toys of a specific type or all the toys. The function takes two parameters:

amount - the quantity of toys to restock.

toyType - the type of toy to restock. Valid values are "lego", "avengers", "mario", "barbie", and "all".

### openOrCloseShop() public returns (string memory)

The openOrCloseShop function is used by the owner to open or close the shop. The function returns a message indicating the current status of the shop.

### purchase(uint amount, string memory toyType) public payable

The purchase function is used by the customers to purchase a toy arrangement by sending the required amount of ether. The function takes two parameters:

amount - the quantity of toys to purchase.

toyType - the type of toy to purchase. Valid values are "lego", "avengers", "mario", "barbie", and "bouquet".

getStock(string memory toyType) public view returns (uint)

### The getStock function is used to get the stock of a specific type of toy. The function takes one parameter:

toyType - the type of toy to get stock for. Valid values are "lego", "avengers", "mario", and "barbie".

### State Variables

The ToyShop smart contract has the following state variables:

owner - the address of the owner of the shop.

shopIsOpen - a boolean variable indicating whether the shop is open or closed.

legoStock - a mapping of the address of the toy shop to the stock of Lego toys.

avengersStock - a mapping of the address of the toy shop to the stock of Avengers toys.

marioStock - a mapping of the address of the toy shop to the stock of Mario toys.

barbieStock - a mapping of the address of the toy shop to the stock of Barbie toys.

carStock - a mapping of the address of the customer to the stock of Car toys.

## License
This smart contract is licensed under the MIT License.
