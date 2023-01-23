// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SaudacoesTokenizadas.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract SaudacoesTokenizadasTest is Test {
    using Counters for Counters.Counter;

    SaudacoesTokenizadas public sdd;
    
    address public alice;
    address public bob;

    function setUp() public {
        alice = makeAddr("alice");
        bob = makeAddr("bob");
        vm.prank(alice);
        sdd = new SaudacoesTokenizadas();
    }

    function testIncrement() public {
        vm.prank(bob);
        sdd.safeMint();
        address owner_of = sdd.ownerOf(1);
        assertEq(owner_of, bob);
    }

    function testSetBaseURI() public {
        vm.prank(alice);
        sdd.changeBaseURI("https://xyz.io");
        assertEq(sdd.storedBaseUrl(), "https://xyz.io");
    }

}
