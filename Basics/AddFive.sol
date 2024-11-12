// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // This is the soidity version

import {SimpleStorage} from "./SimpleStorage.sol";

// AddFiveStorage is inheriting from SimpleStorage
contract AddFiveStorage is SimpleStorage{
    // To override the store function to add five in the favoriteNumber , we need to define the same function here
    // but we need to mark this overriding function as 'override' and the function (in our case the store 
    // function in simpleStorage)which we are overriding as 'virtual'
    // any function which is not virtual is non-overridable

    function store(uint256 _newNumber) public override {
        myFavouriteNumber = _newNumber + 5;
    } 
}
