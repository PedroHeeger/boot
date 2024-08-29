// Armazenando todo conteúdo do arquivo de contrato
var MFC = artifacts.require("MyFirstContract");

// Utilizando o método Deployer do Truffle para deployar o contrato
module.exports = function(deployer) {
    deployer.deploy(MFC);
};