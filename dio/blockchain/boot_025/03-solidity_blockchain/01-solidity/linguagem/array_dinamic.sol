// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Types {
    int[] data;   // Definindo uma variável como array dinâmico

    function array_example() public returns (int[] memory) {
        data = [int(-60), 70, -80, 90, 100, 140];  // Criando uma variável array
        data.push(200);  // Usando uma propriedade do array para inserir um elemento no final do array
        return (data);
    }
}