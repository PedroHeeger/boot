// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Types {
    uint[6] data;   // Definindo uma variável como array

    function array_example() public returns (uint[6] memory) {
        data = [uint(10), 20, 30, 40, 50, 60];  // Criando uma variável array
        return (data);
    }
}