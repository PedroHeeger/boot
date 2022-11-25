# 2) Python para Cientistas de Dados (21)
## 2.3) Curso: Tipos de Operadores com Python (2)
### 2.3.1) Tipos de Operadores
#### 2.3.1.1) Operadores aritméticos
print("Operadores Aritméticos:")
print(1+1)          # Adição
print(10-2)         # Subtração
print(4*3)          # Multiplicação
print(12/3)         # Divisão
print(12//2)        # Divisão Inteira
print(10%3)         # Módulo (Resto da Divisão)
print(2**3)         # Exponeciação
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.3.1.2) Operadores de comparação
print("Operadores de Comparação:")
saldo = 450
saque = 200
print(saldo == saque)          # Igualdade
print(saldo != saque)          # Diferenciação
print(saldo > saque)           # Maior que
print(saldo >= saque)          # Maior ou igual
print(saldo < saque)           # Menor que
print(saldo <= saque)          # Menor ou igual
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.3.1.3) Operadores de atribuição
print("Operadores de Atribuição:")
saldo = 100                    # Atribuição Simples
print(saldo)
saldo += 200                   # Atribuição com Soma
print(saldo)
saldo -= 200                   # Atribuição com Subtração
print(saldo)
saldo *= 2                     # Atribuição com Multiplicação
print(saldo)
saldo /= 2                     # Atribuição com Divisão
print(saldo)
saldo //= 2                    # Atribuição com Divisão Inteira
print(saldo)
saldo **= 2                    # Atribuição com Exponenciação
print(saldo)
saldo %= 2                     # Atribuição com Módulo (Resto da Divisão)
print(saldo)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.3.1.4) Operadores Lógicos
print("Operadores de Lógicos ou Booleanos:")
saldo = 1000
saque = 200
limite = 100

print(saldo >= saque and saque <= limite)       # Operador de Conjunção And (E)
print(saldo >= saque or saque <= limite)        # Operador de Disjunção Or (Ou)
print(not saldo >= saque and saque >= limite)   # Operador de Negação Not (Não)
print(saldo >= saque and saque >= limite)       # Operador de Negação Not (Não) Inverso
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.3.1.5) Operadores de identidade
print("Operadores de identidade:")
curso = "Curso de Python"
nome_curso = curso
saldo, limite = 200, 200

print(curso is nome_curso)                      # Operador de Identidade Is (Existe)
print(curso is not nome_curso)                  # Operador de Identidade Is Not (Não Existe)
print(saldo is limite)                          # Operador de Identidade Is (Existe)
print(saldo is not limite)                      # Operador de Identidade Is Not (Não Existe)

print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.3.1.6) Operadores de associação
print("Operadores de associação:")
curso = "Curso de Python"
frutas = ["laranja", "uva", "limão"]
saque = [1500, 100]

print("Python" in curso)                     # Operador de Associação In (Contém)
print("maçã" not in frutas)                  # Operador de Associação Not In (Não Contém)
print(200 in saque)                          # Operador de Associação In (Contém)
print(1500 not in saque)                     # Operador de Associação Not In (Não Contém)
print("------//------//------//------//------//------//------//------//------//------//------//------//")