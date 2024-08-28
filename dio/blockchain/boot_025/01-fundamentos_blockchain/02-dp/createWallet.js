// Importando as dependencias
const bip32 = require('bip32')
const bip39 = require('bip39')
const bitcoin = require('bitcoinjs-lib')

// Definindo a rede
// const network = bitcoin.networks.bitcoin    // Rede Principal (Mainnet)
const network = bitcoin.networks.testnet       // Rede de Teste (Testnet)

// Carteira Hierárquica Determinística
// Derivação de Carteiras HD
// const path = `m/49'/0'/0'/0`               // Mainnet
const path = `m/49'/1'/0'/0`                  // Testnet

// Criando a frase mnemônica para a seed (Conjunto de palavras aleatórias que formam a seed)
let mnemonic = bip39.generateMnemonic()

// Criando a Seed a partir da frase mnemônica
const seed = bip39.mnemonicToSeedSync(mnemonic)

// Criando a chave mestra (raiz) da carteira HD
let masterKey = bip32.fromSeed(seed, network)

// Criando uma conta (Múltiplos pares de chaves: privadas e públicas)
let account = masterKey.derivePath(path)

// Selecionando o primeiro par de chaves
let keyPair = account.derive(0).derive(0)

// Criando um endereço
let btcAddress = bitcoin.payments.p2wpkh({
    pubkey: keyPair.publicKey,
    network: network,
}).address


// Imprimindo as informações
console.log("Carteira Gerada")
console.log("Seed:", mnemonic)
console.log("Endereço:", btcAddress)
console.log("Chave Privada:", keyPair.toWIF())