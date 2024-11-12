//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";
contract FundMe {
    using PriceConverter for uint256;

    uint256 minimumUSD = 5e18;
    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    address public owner;

    constructor() {
        owner = msg.sender;
    }
    
    function fund() public payable {
        require(msg.value.getConversionRate() >= minimumUSD, "Didn't send enough ETH");
        funders.push(msg.sender); 
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner {
        // require(msg.sender == owner, "Must be owner!");
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);

        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Calling Failed");

    }

    // adding modifier
    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner!");
        _;    // it says add whatever else you want to do in the function here : go back to the withdraw func code
    }
}