// Get funds from the users of this contract
// Withdraw funds to the owner
// Set a minimum funding value in INR

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";
contract FundMe {
    using PriceConverter for uint256;

    uint256 minimumUSD = 5;
    address[] public funders;
    //mapping of funder to the amount he sent
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    
    function fund() public payable {
        // msg.value.getConversionRate;
        // Allow users to send money
        // Have a minimum USD sent  
        // require(getConversionRate(msg.value) >= minimumUSD, "Didn't send enough ETH");  // 1e18 = 1ETH = 1000000000000000000 = 1 * 10 ** 18        
        require(msg.value.getConversionRate() >= minimumUSD, "Didn't send enough ETH");
        funders.push(msg.sender); // address of sender of the transaction to this contract
        addressToAmountFunded[msg.sender] += msg.value;
    }

    //Function which owner of the contract will use to withdraw the money from the contract
    function withdraw() public {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        //Reset the funders array 
        funders = new address[](0);

        // To send funds back to whoever is calling this function
        //    1. Transfer
        // msg.sender = address
        // payable(msg.sender) = payable address  
        // belo line if fails , returns error and reverts the transaction
        payable(msg.sender).transfer(address.(this).balance);

        // 2. Send 
        // wont error but will just return a bool showing unsuccessful or successful transaction
        // this wouldnt revert our transaction and we wont get our money sent
        bool success = payable(msg.sender).send(address.(this).balance);
        require(success, "Sending failed"); // step which reverts our transaction if failed

        // 3. call : using call as if it is a regular transaction
        // call function returns two variables
        // Call function is actually used to call some function so if that function returns some data or value 
        // bytes data type variable is used to hold that data , here it is "dataReturened" variable
        // Since bytes objects are arrays , data returned must be in memory
        // (bool callSuccess, bytes memory dataReturned) = payable(msg.sender).call{value: address(this).balance}(address.("");
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}(address.("");
        require(callSuccess, "Calling Failed");

    }

    
}