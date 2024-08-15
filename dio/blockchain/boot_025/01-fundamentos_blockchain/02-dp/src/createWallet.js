// Importando as dependencias
const bip32 = require('bip32')
const bip39 = require('bip39')
const bitcoin = require('bitcoinjs-lib')

// Definir a rede
// const network = bitcoin.networks.bitcoin    // Rede Principal (Mainnet)
const network = bitcoin.networks.testnet       // Rede de Teste (Testnet)

// Carteira Hierárquica Determinística
// Derivação de Carteiras HD
// const path = `m/49'/0'/0'/0`               // Mainnet
const path = `m/49'/1'/0'/0`                  // Testnet

// Criando o Minemônico para a seed (Conjunto de palavras aleatórias que formam a seed (palavras de senha))
let mnemonic = bip39.gerenateMnemonic()
const seed = bip39.mnemonicToSeedSync(mnemonic)

// Criando a raiz da carteira HD
let root = bip32.fromSeed(seed, network)


// Criando uma conta - Par pvt-pub keys
let account = root.derivePath(path)
let node = account.derive(0).derive(0)

// Criando um endereço
let btcAddress = bitcoin.payments.p2pkh({
    pubkey: node.publicKey,
    network: network,
}).address


// Escrever 
console.log("Carteira Gerada")
console.log("Endereço:", btcAddress)
console.log("Chave Privada:", node.toWIF())
console.log("Seed:", mnemonic)