//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
    uint256 public myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople;
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        Person memory newPerson = Person(_favoriteNumber, _name);
        listOfPeople.push(newPerson);
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    function getPerson(uint256 index) public view returns (Person memory) {
        require(index < listOfPeople.length, "Index out of bounds");
        return listOfPeople[index];
    }
}
