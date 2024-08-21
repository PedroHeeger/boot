// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Memory {
    int[] public numbers;   // Criando uma variável de estado

    // Criando uma função
    function getNumbers() public returns (int[] memory, int[] memory) {
        // Inserindo dois números na variável
        numbers.push(1);
        numbers.push(2);

        int[] memory newNumbers = numbers;  // Criando outra variável a partir da variável anterior
        newNumbers[0] = 12;  // Alterando o primeiro número da segunda variável para 12

        return (numbers, newNumbers);  // Retornando os números das duas variáveis
    }
}