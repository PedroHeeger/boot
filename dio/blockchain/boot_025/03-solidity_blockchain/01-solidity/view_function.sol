//variáveis de estado
uint num1 = 10;
uint num2 = 16;

function getResult() public view returns(uint product, uint sum){
    product = num1 * num2;
    sum = num1 + num2;
}
