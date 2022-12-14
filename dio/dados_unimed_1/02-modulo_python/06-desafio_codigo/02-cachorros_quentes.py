# 6-Desafio de código: Desafios Iniciais Py-Unimed-BH (3)
## 6.1.2 Cachorros-Quentes

# DICAS SOBRE PYTHON:
# FUNÇÃO input(): Ela recebe como parâmetro uma String que será visível ao usuário, 
# onde geralmente informa que tipo de informação ele está esperando receber;
# FUNÇÃO print(): Ela é a responsável por imprimir os dados e informar os valores no terminal;
# MÉTODO split(): permite dividir o conteúdo da variável de acordo com as condições especificadas 
# em cada parâmetro da função ou com os valores predefinidos por padrão;

# Abaixo segue um exemplo de código que você pode ou não utilizar
valores = input().split() 

# TODO:  Calcule a média de cachorros quentes consumidas por participante e imprima o valor com DUAS casas decimais.

cachorro_quente = int(valores[0])
participante = int(valores[1])
# print(cachorro_quente)

media = cachorro_quente / participante
# print(media)
print(f"{media:.2f}")