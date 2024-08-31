// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
 
// Interface de funções seguras para operações matemáticas
contract SafeMath {
    // Função para adição segura de dois inteiros sem risco de overflow
    function safeAdd(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a); // Garante que não ocorreu overflow
    }
 
    // Função para subtração segura de dois inteiros sem risco de underflow
    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a); // Garante que não ocorrerá underflow
        c = a - b;
    }
 
    // Função para multiplicação segura de dois inteiros sem risco de overflow
    function safeMul(uint a, uint b) public pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b); // Verifica overflow
    }
 
    // Função para divisão segura de dois inteiros sem risco de divisão por zero
    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0); // Garante que o divisor é maior que zero
        c = a / b;
    }
}
 
 
// Interface do padrão ERC-20 para tokens fungíveis
contract ERC20Interface {
    // Retorna o total de tokens existentes
    function totalSupply() public view returns (uint);
    
    // Retorna o saldo de tokens de um determinado endereço
    function balanceOf(address tokenOwner) public view returns (uint balance);
    
    // Retorna a quantidade de tokens que o 'spender' pode gastar em nome do 'tokenOwner'
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
    
    // Transfere tokens do chamador para o endereço especificado
    function transfer(address to, uint tokens) public returns (bool success);
    
    // Aprova um 'spender' para gastar uma quantidade específica de tokens do chamador
    function approve(address spender, uint tokens) public returns (bool success);
    
    // Transfere tokens do 'from' para o 'to' usando a permissão aprovada
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
 
    // Evento emitido quando tokens são transferidos
    event Transfer(address indexed from, address indexed to, uint tokens);
    
    // Evento emitido quando uma aprovação é feita
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}
 
 
// Interface para receber aprovação e executar uma função em uma chamada
contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address token, bytes data) public;
}
 

// Contrato de token real que implementa a interface ERC20 e funções de matemática segura
contract DIOToken is ERC20Interface, SafeMath {
    string public symbol; // Símbolo do token, por exemplo, 'DIO'
    string public name; // Nome do token, por exemplo, 'DIO Coin'
    uint8 public decimals; // Número de casas decimais para exibição de tokens
    uint public _totalSupply; // Quantidade total de tokens emitidos
 
    // Mapeia endereços aos seus saldos de tokens
    mapping(address => uint) balances;

    // Mapeia endereços aos seus respectivos limites de gasto aprovados
    mapping(address => mapping(address => uint)) allowed;
 
    // Construtor que define os parâmetros do token e atribui todo o suprimento à conta de deploy
    constructor() public {
        symbol = "DIO"; // Define o símbolo do token
        name = "DIO Coin"; // Define o nome do token
        decimals = 2; // Define que o token tem 2 casas decimais
        _totalSupply = 100000; // Define o suprimento total de tokens
        balances[YOUR_METAMASK_WALLET_ADDRESS] = _totalSupply; // Atribui todo o suprimento ao endereço do deployer
        emit Transfer(address(0), YOUR_METAMASK_WALLET_ADDRESS, _totalSupply); // Emite o evento de transferência inicial
    }
 
    // Retorna o total de tokens em circulação (exclui tokens queimados)
    function totalSupply() public view returns (uint) {
        return _totalSupply - balances[address(0)];
    }
 
    // Retorna o saldo de um proprietário específico
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }
 
    // Transfere tokens do chamador para um endereço especificado
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], tokens); // Subtrai tokens do remetente
        balances[to] = safeAdd(balances[to], tokens); // Adiciona tokens ao destinatário
        emit Transfer(msg.sender, to, tokens); // Emite o evento de transferência
        return true;
    }
 
    // Aprova um 'spender' para gastar uma quantidade específica de tokens em nome do chamador
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens; // Define o limite de gasto aprovado
        emit Approval(msg.sender, spender, tokens); // Emite o evento de aprovação
        return true;
    }
 
    // Transfere tokens de um endereço para outro, usando a permissão aprovada
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = safeSub(balances[from], tokens); // Subtrai tokens do remetente
        allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens); // Reduz o limite de gasto permitido
        balances[to] = safeAdd(balances[to], tokens); // Adiciona tokens ao destinatário
        emit Transfer(from, to, tokens); // Emite o evento de transferência
        return true;
    }
 
    // Retorna a quantidade de tokens que um 'spender' ainda pode gastar em nome de um proprietário
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
 
    // Aprova tokens e executa uma função em uma única chamada
    function approveAndCall(address spender, uint tokens, bytes data) public returns (bool success) {
        allowed[msg.sender][spender] = tokens; // Aprova os tokens
        emit Approval(msg.sender, spender, tokens); // Emite o evento de aprovação
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, this, data); // Chama a função do contrato destino
        return true;
    }
 
    // Fallback function para reverter transações quando o contrato é chamado diretamente sem dados
    function () public payable {
        revert(); // Reverte a transação
    }
} 
