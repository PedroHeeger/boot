# 19-Desafio de código: Desafios Intermediários Py-Unimed-BH (3)
## 19.1.3-Aumento Salarial

# DICAS SOBRE PYTHON:
# FUNÇÃO input(): Ela recebe como parâmetro uma String que será visível ao usuário, 
# onde geralmente informa que tipo de informação ele está esperando receber;
# FUNÇÃO print(): Ela é a responsável por imprimir os dados e informar os valores no terminal;
# MÉTODO split(): permite dividir o conteúdo da variável de acordo com as condições especificadas 
# em cada parâmetro da função ou com os valores predefinidos por padrão;

# Abaixo segue um exemplo de código que você pode ou não utilizar
# TODO:  Calcule o salário do funcionário e print o novo salário, bem como o valor de reajuste ganho e o índice reajustado (em porcentagem)
salario = int(input()) 

if (salario <= 600):
  percentual = 17
  
elif (600 < salario <= 900):
  percentual = 13

elif (900 < salario <= 1500):
  percentual = 12

elif (1500 < salario <= 2000):
  percentual = 10

else: 
  percentual = 5
  
reajuste = salario * percentual/100
salario = salario + reajuste


print(f"Novo salario: {salario:2.2f}\n Reajuste ganho: {reajuste:2.2f}\n Em percentual: {percentual} %") 