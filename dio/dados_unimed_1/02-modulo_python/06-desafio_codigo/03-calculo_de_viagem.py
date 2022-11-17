# 6-Desafio de código: Desafios Iniciais Py-Unimed-BH (3)
## 6.1.3 Cálculo de viagem

# DICAS SOBRE PYTHON:
# FUNÇÃO input(): Ela recebe como parâmetro uma String que será visível ao usuário, 
# onde geralmente informa que tipo de informação ele está esperando receber;
# FUNÇÃO print(): Ela é a responsável por imprimir os dados e informar os valores no terminal;
# MÉTODO split(): permite dividir o conteúdo da variável de acordo com as condições especificadas 
# em cada parâmetro da função ou com os valores predefinidos por padrão;

# Abaixo segue um exemplo de código que você pode ou não utilizar
valores = input().split()

# TODO:  Calcule quantidade de litros necessária para realizar a viagem e imprima com TRÊS dígitos após o ponto decimal

# print(valores)
tempo = int(valores[0])
velocidade_media = int(valores[1])

# Cálculo
distancia = velocidade_media * tempo
litros = distancia / 12
print(f"{litros:.3f}")