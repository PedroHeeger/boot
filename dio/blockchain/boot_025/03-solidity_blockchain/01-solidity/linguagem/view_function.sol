// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ViewFunctions {
    // Variáveis de Estado
    uint num1 = 10;
    uint num2 = 16;

    function getResult() public view returns(uint product, uint sum){
        product = num1 * num2; // Variável Local
        sum = num1 + num2; // Variável Local
        return (product, sum);
    }
}