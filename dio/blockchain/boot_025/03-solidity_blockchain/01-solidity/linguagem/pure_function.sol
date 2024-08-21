// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PureFunctions {
    function getResult() public pure returns(uint product, uint sum){
        uint num1 = 2; // Variáveis Locais
        uint num2 = 4; // Variáveis Locais
        product = num1 * num2; // Variáveis Locais
        sum = num1 + num2; // Variáveis Locais
        return (product, sum);
    }
}