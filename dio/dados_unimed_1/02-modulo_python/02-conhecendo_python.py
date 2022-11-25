# 2) Python para Cientistas de Dados (21)
## 2.2) Curso: Conhecendo a Linguagem de Programação Python (2)
### 2.2.1) Conhecendo a linguagem (5)
#### 2.2.1.1) Tipos de Dados
print("Tipos de Dados:")
print(11 + 10 + 1000)    # Tipo Inteiro
print(1.5 + 1 + 0.5)     # Tipo Float
print(True)              # Tipo Booleano
print(False)             # Tipo Booleano
print("Python")          # Tipo String
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.2.1.2) Modo interativo
print("Função dir:")
q1 = dir()
print(q1)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

import math
q2 = dir()
print(q2)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

q3 = dir(100)
print(q3)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

# q4 = help()
# print(q4)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

# q5 = help(100)
# print(q5)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.2.1.3) Variáveis e constantes
print("Variáveis:")
age = 23
name = 'Guilherme'
print(f'Meu nome é {name} e eu tenho {age} anos de idade.')
print("------//------//------//------//------//------//------//------//------//------//------//------//")

age, name = (29, 'Pedro')
print("Meu nome é {} e eu tenho {} anos de idade.".format(name, age))
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.2.1.4) Conversão de tipos
print("Inteiro para float:")
preco = 10
print(preco)

preco = float(preco)
print(preco)

preco = 10/2
print(preco)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Float para Inteiro:")
preco = 10.30
print(preco)

preco = int(preco)
print(preco)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Conversão por divisão:")
preco = 10
print(preco)

print(preco / 2)
print(preco // 2)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Numérico para String:")
preco = 10.50
idade = 28
print(str(preco))
print(str(idade))

texto = f"Idade {idade} preco {preco}"
print(texto)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("String para número:")
preco = "10.50"
idade = "28"
print(float(preco))
print(int(idade))
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Verificando o tipo:")
preco = "10.50"
idade = 28
print(type(preco))
print(type(idade))
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.2.1.5) Funções de entrada e saída
print("Funções de entrada e saída:")
nome = input("Informe o seu nome: ")
sobrenome = input("Informe o seu sobrenome: ")
print(nome, sobrenome)
print(nome, sobrenome, end="...\n")
print(nome, sobrenome, sep="#")
print(nome, sobrenome, sep="#", end="...\n")
print("------//------//------//------//------//------//------//------//------//------//------//------//")