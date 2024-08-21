// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Teste {
    // Criando uma struct
    struct Book {
        string title;
        string author;
        uint book_id;
    }

    // Instanciando uma struct
    Book book;

    // Utilizando uma função do tipo set para alterar as propriedades da struct
    function setBook() public {
        book = Book('Solidity for Dummies', 'DIO', 1);
    }

    // Utilizando uma fução do tipo get para retornar uma das propriedades da struct
    function getBookTitle() public view returns (string memory) {
        return book.title;
    }
}