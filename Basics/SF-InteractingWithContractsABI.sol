// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    // SimpleStorage public simpleStorage;
    // Running list of all the simple storage contracts that we are deploying
    SimpleStorage[] public listOfSimpleStorageContracts;

    // This function creates a simple storage contracts
    function CreateSimpleStorageContract() public{
        SimpleStorage newSimpleStorage = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorage);
        
    }

    // This function calls the store function of the SimpleStorageContract to store the value of the favoriteNumber.
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // For interacting with othher contracts we need two things
        // 1. Address   and   2. ABI
        
        // SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        // mySimpleStorage.store(_newSimpleStorageNumber);

        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    //Function which reads values from the simple storage contracts.
    function sfget(uint256 _simpleStorageIndex) public view returns(uint256){
        //  SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        //  return mySimpleStorage.retrieve();

         return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}