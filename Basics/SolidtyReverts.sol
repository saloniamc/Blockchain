// Get funds from the users of this contract
// Withdraw funds to the owner
// Set a minimum funding value in INR

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract FundMe {
    uint256 num = 1;
    // Function which users call to send money to the contract
    // just like the wallet holds funds the keyword 'payable' makes this contract to hold funds
    // So when you deploy a contract , same as wallet address , it acts as a wallet address,
    // you can send money to it and interact with it.
    //In order for a function to receive a native blockchain token we need to mark that function as payable
    function fund() public payable {
        // Allow users to send money
        // Have a minimum INR sent
        //How do we send ETH to this contract?
        // gets the number of wei sent with the message i.e to get the value amount o ftransaction
        num = num + 2;  // this will be reverted too if the below require gets transaction failed
        require(msg.value > 1e18, "Didn't send enough ETH");  // 1e18 = 1ETH = 1000000000000000000 = 1 * 10 ** 18
                                    // require keyowrd is a checker here which says that if the msg.value 
                                    //is not greater than one eth then revert this transaction 

    }

    //Function which owner of the contract will use to withdraw the money from the contract
    function withdraw() public {

    }
}

// Chainlink is a technology for getting external data and computation into our smart contracts (in a decentralized contexts)