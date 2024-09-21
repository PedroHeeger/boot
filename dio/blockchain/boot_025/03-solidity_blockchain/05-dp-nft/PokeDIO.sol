// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// Importando o contrato ERC721 da OpenZeppelin, que implementa o padrão para tokens não fungíveis (NFTs).
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// Definindo o contrato PokeDIO, que herda funcionalidades do contrato ERC721.
contract PokeDIO is ERC721 {
    // Struct que define um Pokemon com um nome, nível e uma imagem.
    struct Pokemon {
        string name;  // Nome do Pokemon.
        uint level;   // Nível do Pokemon.
        string img;   // URL ou caminho para a imagem do Pokemon.
    }

    // Array que armazena todos os Pokemons criados no jogo.
    Pokemon[] public pokemons;
    
    // Variável de endereço do dono do jogo, que tem permissão para criar novos Pokemons.
    address public gameOwner;

    // Construtor do contrato que define o nome e o símbolo do token, e atribui o criador do contrato como o dono do jogo.
    constructor() ERC721("PokeDIO", "PKD") {
        gameOwner = msg.sender;
    }

    // Modificador que restringe certas funções para serem executadas apenas pelo dono de um Pokemon específico.
    modifier onlyOwnerOf(uint _monsterId) {
        // Verifica se o chamador da função é o dono do Pokemon com o ID fornecido.
        require(ownerOf(_monsterId) == msg.sender, "Apenas o dono pode batalhar com este Pokemon");
        _;
    }

    // Função que permite que dois Pokemons batalhem entre si, aumentando o nível do vencedor e do perdedor.
    function battle(uint _attackingPokemon, uint _defendingPokemon) public onlyOwnerOf(_attackingPokemon) {
        // Referência ao Pokemon atacante.
        Pokemon storage attacker = pokemons[_attackingPokemon];
        
        // Referência ao Pokemon defensor.
        Pokemon storage defender = pokemons[_defendingPokemon];

        // Lógica de batalha: se o atacante tem nível maior ou igual ao defensor, ele ganha mais níveis.
        if (attacker.level >= defender.level) {
            attacker.level += 2;  // Atacante ganha 2 níveis.
            defender.level += 1;  // Defensor ganha 1 nível.
        } else {
            attacker.level += 1;  // Atacante ganha 1 nível.
            defender.level += 2;  // Defensor ganha 2 níveis.
        }
    }

    // Função que cria um novo Pokemon e o atribui a um endereço especificado.
    function createNewPokemon(string memory _name, address _to, string memory _img) public {
        // Verifica se o chamador da função é o dono do jogo.
        require(msg.sender == gameOwner, "Apenas o dono do jogo pode criar novos Pokemons");
        
        // ID do novo Pokemon, que é o índice do array `pokemons`.
        uint id = pokemons.length;
        
        // Cria um novo Pokemon com o nome, nível inicial 1, e imagem fornecidos, e o adiciona ao array.
        pokemons.push(Pokemon(_name, 1, _img));
        
        // Usa a função `_safeMint` da ERC721 para criar um novo token NFT para o novo Pokemon e o atribui ao endereço `_to`.
        _safeMint(_to, id);
    }
}