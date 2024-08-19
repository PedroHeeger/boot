// SPDX-License-Identifier: MIT
// pragma solidity ^0.5.0;
pragma solidity ^0.8.0;

// Definição da biblioteca
library LibExample {

    // Função que calcula a potenciação de um número com outro
    function pow(uint a, uint b) public view returns (uint, address){
        return (a ** b, address(this));
    }
}

// Definição do contrato
contract LibraryExample {

    // Deploy da biblioteca para o tipo de dado inteiro
    using LibExample for uint;
    address owner = address(this);

    // Chamando a função da biblioteca
    function getPow(uint num1, uint num2) public view returns (uint, address) {
        return num1.pow(num2);
    }
}