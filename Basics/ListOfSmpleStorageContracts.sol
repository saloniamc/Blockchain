// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    // SimpleStorage public simpleStorage;
    // Running list of all the simple storage contracts that we are deploying
    SimpleStorage[] public listOfSimpleStorageContracts;

    function CreateSimpleStorageContract() public{
        SimpleStorage newSimpleStorage = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorage);
        
    }
}