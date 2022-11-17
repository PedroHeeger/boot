# 19-Desafio de código: Desafios Intermediários Py-Unimed-BH (3)
## 19.1.1-Alfabeto

# DICAS SOBRE PYTHON:
# FUNÇÃO input(): Ela recebe como parâmetro uma String que será visível ao usuário, 
# onde geralmente informa que tipo de informação ele está esperando receber;
# FUNÇÃO print(): Ela é a responsável por imprimir os dados e informar os valores no terminal;
# MÉTODO ord(): Retorna o valor  ASCII de cada letra ou símbolo do teclado;
letra = input() 


# TODO: De acordo com a entrada, imprima a posição dessa letra no Alfabeto;
import string
lista = list(string.ascii_uppercase)

# print(lista)
n = [indice+1 for indice, item in enumerate(lista) if item == letra]
  # print(indice+1, item)
  
n = n[0]
print(str(n))