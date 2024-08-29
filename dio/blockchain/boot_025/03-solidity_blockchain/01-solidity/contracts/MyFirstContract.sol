// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract MyFirstContract {
    string public initialString = "Hello World!";

    function getString() public view returns (string memory) {
        return initialString;
    }
}