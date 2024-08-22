// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";
import {DeploySimpleStorage} from "../script/DeploySimpleStorage.s.sol";

contract SimpleStorageTest is Test {
    SimpleStorage simpleStorage;
    DeploySimpleStorage deploySimpleStorage;

    function setUp() external {
        deploySimpleStorage = new DeploySimpleStorage();
        deploySimpleStorage.run();

        simpleStorage = deploySimpleStorage.simpleStorage();
    }

    function testStore() external {
        simpleStorage.store(42);
        uint256 favoriteNumber = simpleStorage.retrieve();
        assertEq(favoriteNumber, 42);
    }

    function testAddPerson() external {
        simpleStorage.addPerson("Alice", 42);
        uint256 favoriteNumber = simpleStorage.nameToFavoriteNumber("Alice");
        assertEq(favoriteNumber, 42);
    }

    function testListOfPeople() external {
        simpleStorage.addPerson("Alice", 42);
        simpleStorage.addPerson("Bob", 43);
        simpleStorage.addPerson("Charlie", 44);

        assertEq(simpleStorage.getPerson(0).favoriteNumber, 42);
        assertEq(simpleStorage.getPerson(1).favoriteNumber, 43);
        assertEq(simpleStorage.getPerson(2).favoriteNumber, 44);
    }
}
