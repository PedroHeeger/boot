// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// Interface do padrão ERC-20, define as funções e eventos que todo token ERC-20 deve implementar.
interface IERC20 {

    // Função para obter o total de tokens em circulação.
    function totalSupply() external view returns (uint256);

    // Função para obter o saldo de uma conta específica.
    function balanceOf(address account) external view returns (uint256);

    // Função para verificar quanto um `spender` está autorizado a gastar em nome do `owner`.
    function allowance(address owner, address spender) external view returns (uint256);

    // Função para transferir tokens do chamador para outro endereço.
    function transfer(address recipient, uint256 amount) external returns (bool);

    // Função para aprovar um `spender` a gastar uma quantidade específica de tokens em nome do chamador.
    function approve(address spender, uint256 amount) external returns (bool);

    // Função para transferir tokens do `owner` para um `recipient`, utilizando a autorização prévia do `owner`.
    function transferFrom(address spender, address recipient, uint256 amount) external returns (bool);

    // Evento emitido quando tokens são transferidos de um endereço para outro.
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Evento emitido quando uma aprovação é feita para permitir que um `spender` gaste tokens em nome de um `owner`.
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// Implementação do contrato DIOCoin que segue a interface ERC-20.
contract DIOCoin is IERC20 {
    // Nome do token.
    string public constant name = "DIO Coin";
    
    // Símbolo do token.
    string public constant symbol = "DIO";
    
    // Quantidade de casas decimais que o token suporta (18 é o padrão para tokens ERC-20).
    uint8 public constant decimals = 18;

    // Mapeamento que armazena o saldo de cada endereço.
    mapping (address => uint256) balances;

    // Mapeamento que armazena as permissões de gasto de tokens.
    mapping (address => mapping(address => uint256)) allowed;

    // Variável que armazena o total de tokens em circulação.
    uint256 totalSupply_ = 10 ether; // 10 tokens com 18 casas decimais.

    // Construtor do contrato, atribui todo o supply inicial ao criador do contrato.
    constructor(){
        balances[msg.sender] = totalSupply_;
    }

    // Função que retorna o total de tokens em circulação.
    function totalSupply() public override view returns (uint256) {
        return totalSupply_;
    }

    // Função que retorna o saldo de uma conta específica.
    function balanceOf(address tokenOwner) public override view returns (uint256) {
        return balances[tokenOwner];
    }

    // Função para transferir tokens do chamador para outro endereço.
    function transfer(address receiver, uint256 numTokens) public override returns (bool) {
        // Verifica se o chamador tem saldo suficiente para a transferência.
        require(numTokens <= balances[msg.sender]);
        
        // Subtrai a quantidade transferida do saldo do chamador.
        balances[msg.sender] = balances[msg.sender] - numTokens;
        
        // Adiciona a quantidade transferida ao saldo do receptor.
        balances[receiver] = balances[receiver] + numTokens;
        
        // Emite um evento Transfer para registrar a transferência.
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }

    // Função para aprovar um `delegate` a gastar uma quantidade específica de tokens em nome do chamador.
    function approve(address delegate, uint256 numTokens) public override returns (bool) {
        // Define a quantidade de tokens que o `delegate` está autorizado a gastar.
        allowed[msg.sender][delegate] = numTokens;
        
        // Emite um evento Approval para registrar a aprovação.
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }

    // Função que retorna a quantidade de tokens que um `delegate` está autorizado a gastar em nome do `owner`.
    function allowance(address owner, address delegate) public override view returns (uint256) {
        return allowed[owner][delegate];
    }

    // Função que permite a um `delegate` transferir tokens do `owner` para um `buyer`, utilizando a autorização prévia do `owner`.
    function transferFrom(address owner, address buyer, uint256 numTokens) public override returns (bool) {
        // Verifica se o `owner` tem saldo suficiente para a transferência.
        require(numTokens <= balances[owner]);
        
        // Verifica se o `delegate` está autorizado a gastar a quantidade de tokens.
        require(numTokens <= allowed[owner][msg.sender]);

        // Subtrai a quantidade transferida do saldo do `owner`.
        balances[owner] = balances[owner] - numTokens;
        
        // Subtrai a quantidade transferida da permissão do `delegate`.
        allowed[owner][msg.sender] = allowed[owner][msg.sender] - numTokens;
        
        // Adiciona a quantidade transferida ao saldo do `buyer`.
        balances[buyer] = balances[buyer] + numTokens;
        
        // Emite um evento Transfer para registrar a transferência.
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}
