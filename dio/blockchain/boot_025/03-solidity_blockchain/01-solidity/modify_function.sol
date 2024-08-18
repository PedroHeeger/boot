contract Owner {
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    function abort() onlyOwner { // Uso do Modificador
        // ...
    }
}