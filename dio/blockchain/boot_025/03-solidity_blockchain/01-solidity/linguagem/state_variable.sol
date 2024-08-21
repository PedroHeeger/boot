// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StateVariable {
    uint storedData; // Declarando uma variável de estado

    constructor() public {
        storedData = 10; // Utilizando uma variável de estado
    }

    function getResult() public view returns(uint){
        uint a = 1; // Declarando uma variável local, só funciona dentro dessa função
        return storedData; // Acessando uma variável de estado
    }
}