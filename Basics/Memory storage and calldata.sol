// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // This is the soidity version

contract SimpleStorage{
    
    uint256  myFavouriteNumber;

    //To create an array of uints
    uint256[] listOfFavoriteNumber;

    // Creating cutsom data type & creating a varibale of the custom data type
    struct Person{
        uint favouriteNumber;
        string name;
    }
    Person public myFriend = Person(7, "Sal"); 
    // we could also do  -   Person({favoriteNumber: 7, name: "Sal"})

    // Creating a Dynamic array of custom data types     : Static Array eg- Person[3] public listOfPeople;
    Person[] public listOfPeople;
    

    function store(uint256 _favouriteNumber) public{
        myFavouriteNumber = _favouriteNumber;
    }

    // view, pure 
    function retrieve() public view returns(uint256){
        return myFavouriteNumber;
    }


    //  memory, Calldata ,Storage   :- Places where the EVM can read or write

    //memory, Calldata :- the varibles are going to exist only for the duartion of the function call
    // default mostly to memory
    // memory varibale can be changed or manipulated inside func , but calldata variable cannot be changed.

    function addPeople(string memory _name, uint256 _favoriteNumber) public {
        Person memory newPerson = Person(_favoriteNumber, _name);
        listOfPeople.push(newPerson);
        //We could also do  listOfPeople.push( Person(_favoriteNumber, _name)  );
    }

    // Summary : Structs , mappings and arrays need to be given this memory or calldata keyword
    // String is an Array of bytes

}