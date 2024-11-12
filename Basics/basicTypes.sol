// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // This is the soidity version

contract SimpleStorage{
    // Basic types : boolean, uint, int , address, ,bytes
    bool hasFavouriteNumber = true;
    uint favouriteNumber = 88;  // unsigned Positive whole number    uint = uint256 bydefault  
    string favouriteNumberString = "eighty-eight";
    int favouriteNumberInt = -88;  // Signed number: Positive or negative    int = int256 bydefault
    address favouriteNumberAddress = 0x1414Ddb4995d94FD9a526223fc178d4EE1C71570;
    bytes32 favouriteBytes32 = "cat";  // bytes32 != bytes

    // Every type has a default value meaning if we dont set value to some variable it gets set to a default value
    uint example; 
    // here example gets initialuzed to 0 if no value is set to it 
}
