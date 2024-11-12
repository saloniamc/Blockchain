// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// import "./SimpleStorage.sol";

// Named imports : if SimpleStorage.sol has many other contracts like SimpleStorage2, SimpleStorage3 etc,
// we can include specific contrcat that we want by writing its name in { }
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {

    // Just like the struct keyword is used to create a type of person , 
    // the contract keyword allows to create a type of SimpleStorage

    // uint public favNumber
    // type visibility name
    SimpleStorage public simpleStorage;

    // This function is going to deploy the simple storage contract and we need to save it in the state or storage variable
    function CreateSimpleStorageContract() public{
        //How does the storage factory know what simple storage looks like ?

        simpleStorage = new SimpleStorage();
        // The new keyord is how solidity knows to deploy a contract
    }
}