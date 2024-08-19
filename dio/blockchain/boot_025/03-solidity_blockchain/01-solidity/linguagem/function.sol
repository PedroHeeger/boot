program solidity ^0.5.0;
contract SolidityTest {
    constructor() public {
    }
    function getResult() public view returns(uint){
        uint a = 1;
        uint result = a * 2;
        return result;
    }
}