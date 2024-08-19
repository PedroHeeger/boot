// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorl{
    string public hello = "Hello World";
    string public name = "";

    function setName (string memory _name) public {
        name = _name;
    }

    function setHello (string memory _hello) public {
        hello = _hello;
    }
}