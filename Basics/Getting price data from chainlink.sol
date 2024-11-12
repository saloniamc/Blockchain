// Get funds from the users of this contract
// Withdraw funds to the owner
// Set a minimum funding value in INR

//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 minimumUSD = 5;
    
    function fund() public payable {
        // Allow users to send money
        // Have a minimum USD sent  

        require(msg.value > minimumUSD, "Didn't send enough ETH");  // 1e18 = 1ETH = 1000000000000000000 = 1 * 10 ** 18                             
    }

    // Function to get the price of Ethereum interms of INR
    function getPrice() public view returns (uint256){
        // Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price,,,) = priceFeed.latestRoundData();
        // Price of ETh in terms of USD
        // 2000.00000000 price has 8 decimal places but msg.value has 18, so this functions price will be passed to the msg.value
        // function , so we need to match up with msg.value decimals , i.e we need to add 18 - 8 = 10 decimal places
        return uint256(price * 1e18);
    }
    function getConversionRate() public{}

    function getVersion() public view returns(uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

    //Function which owner of the contract will use to withdraw the money from the contract
    // function withdraw() public {}
}
