// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;
pragma solidity >=0.7.0 <0.9.0;

contract DIOVoting {
    // Mapeamento que associa o nome de cada candidato ao número de votos recebidos.
    mapping (string => uint256) public votesReceived;

    // Array que armazena a lista de candidatos.
    string[] public candidateList;
    
    // Construtor do contrato que inicializa a lista de candidatos.
    // Recebe um array de strings como argumento, onde cada string é o nome de um candidato.
    constructor (string[] memory candidateNames){
        candidateList = candidateNames;
    }

    // Função para calcular o número total de votos que um candidato específico recebeu.
    function totalVotesFor(string memory candidate) view public returns (uint256){
        require(validCandidate(candidate));  // Verificando se o candidato existe na lista.
        return votesReceived[candidate];
    }

    // Função para registrar um voto para o candidato especificado.
    function voteForCandidate (string memory candidate) public {
        require(validCandidate(candidate));  // Verificando se o candidato existe na lista.
        votesReceived[candidate] += 1;
    }

    // Função auxiliar que verifica se um candidato está na lista de candidatos válidos.
    // Compara o nome do candidato passado como argumento com os nomes na lista.
    function validCandidate(string memory candidate) view public returns (bool){
        for(uint i = 0; i < candidateList.length; i++){
            if (keccak256(abi.encodePacked(candidateList[i])) == keccak256(abi.encodePacked(candidate))){
                return true;
            }
        }
        return false;
    }
}