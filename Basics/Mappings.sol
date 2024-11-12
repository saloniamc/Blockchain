// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // This is the soidity version

contract SimpleStorage{
    
    uint256  myFavouriteNumber;
    uint256[] listOfFavoriteNumber;


    struct Person{
        uint favouriteNumber;
        string name;
    }
    Person public myFriend = Person(7, "Sal"); 

    Person[] public listOfPeople;
    
    // Mapping Declaration 
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favouriteNumber) public{
        myFavouriteNumber = _favouriteNumber;
    }

    // view, pure 
    function retrieve() public view returns(uint256){
        return myFavouriteNumber;
    }

    function addPeople(string memory _name, uint256 _favoriteNumber) public {
        Person memory newPerson = Person(_favoriteNumber, _name);
        listOfPeople.push(newPerson);
       nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // when we want to access a speecific person's fav number we will need to
    // iterate thru the array chcek all indices - eg we want to see A's fav 
    // number we need to check all indices to know where A is and then its fav number
    // Mappings :- or dictionary , to overcome above problem we have mappings


}


EVM - is a standard for how to compile and how to deploy smart contracts to the blockchain
