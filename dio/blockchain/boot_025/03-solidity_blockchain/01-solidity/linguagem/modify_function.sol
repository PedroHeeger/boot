// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModifyFunction {
    address public owner; // Variável para armazenar o endereço da conta do proprietário

    // Construtor que define o endereço da conta do proprietário como o endereço que faz o deploy
    constructor() {
        owner = msg.sender;
    }

    // Modificador que garante que somente o proprietário possa chamar a função
    modifier onlyOwner {
        require(msg.sender == owner, "Not authorized"); // Verifica se a conta que chamou a função é o proprietário
        _; // Placeholder para o corpo da função
    }

    // Função que só pode ser chamada pelo proprietário
    function abort() public onlyOwner {
        // Corpo da função que será executado apenas se o modificador onlyOwner passar
    }
}