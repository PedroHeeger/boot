# 10-Explorando Conjuntos em Python
## 10.1-Explorando Conjuntos em Python
### 10.1.1-Conjuntos
print("Exemplos de conjuntos:")
print(set([1,2,3,1,3,4]))                           # {1, 2, 3, 4}
print(set("abacaxi"))                               # {"b", "a", "c", "x", "i"}
print(set(("palio", "gol", "celta", "palio")))      # {"gol", "celta", "palio"}
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Acessando os dados:")
numeros = {1,2,3,2}
# print(numeros[0])                      # ERRO: Não é possível acessar os valores de set

numeros = list(numeros)
print(numeros[0])
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Iterar conjuntos:")
carros = {"gol", "celta", "palio"}

for carro in carros:
    print(carro)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Função enumerate:")
carros = {"gol", "celta", "palio"}

for indice, carro in enumerate(carros):
    print(f"{indice}: {carro}")
print("------//------//------//------//------//------//------//------//------//------//------//------//")

### 10.1.1-Conjuntos (Métodos da classe set)
print(".union():")
conjunto_a = {1, 2}
conjunto_b = {3, 4}

print(conjunto_a.union(conjunto_b))         # {1, 2, 3, 4}
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".intersection():")
conjunto_a = {1, 2, 3}
conjunto_b = {2, 3, 4}

print(conjunto_a.intersection(conjunto_b))         # {2, 3}
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".difference():")
conjunto_a = {1, 2, 3}
conjunto_b = {2, 3, 4}

print(conjunto_a.difference(conjunto_b))         # {1}
print(conjunto_b.difference(conjunto_a))         # {4}
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".symmetric_difference():")
conjunto_a = {1, 2, 3}
conjunto_b = {2, 3, 4}

print(conjunto_a.symmetric_difference(conjunto_b))         # {1, 4}
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".issubset():")
conjunto_a = {1, 2, 3}
conjunto_b = {4, 1, 2, 5, 6, 3}

print(conjunto_a.issubset(conjunto_b))         # True
print(conjunto_b.issubset(conjunto_a))         # False
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".issuperset():")
conjunto_a = {1, 2, 3}
conjunto_b = {4, 1, 2, 5, 6, 3}

print(conjunto_a.issuperset(conjunto_b))         # False
print(conjunto_b.issuperset(conjunto_a))         # True
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".isdisjoint():")
conjunto_a = {1, 2, 3, 4, 5}
conjunto_b = {6, 7, 8, 9}
conjunto_c = {1, 0}

print(conjunto_a.isdisjoint(conjunto_b))         # True
print(conjunto_a.isdisjoint(conjunto_c))         # False
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".add():")
sorteio = {1, 23}

sorteio.add(25)                           # {1, 25, 23}
print(sorteio)
sorteio.add(42)                           # {1, 42, 25, 23}
print(sorteio)
sorteio.add(25)                           # {1, 42, 25, 23}
print(sorteio)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".clear():")
sorteio = {1, 23}

sorteio.clear()
print(sorteio)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".copy():")
sorteio = {1, 23}

sorteio2 = sorteio.copy()
print(id(sorteio), id(sorteio2))
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".discard():")
numeros = {1, 2, 3, 1, 2, 4, 5, 5, 6, 7, 8, 9, 0}

print(numeros)                   # {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
numeros.discard(1)
print(numeros)                   # {0, 2, 3, 4, 5, 6, 7, 8, 9}
numeros.discard(45)
print(numeros)                   # {0, 2, 3, 4, 5, 6, 7, 8, 9}
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".pop():")
numeros = {1, 2, 3, 1, 2, 4, 5, 5, 6, 7, 8, 9, 0}

print(numeros)                   # {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
numeros.pop()
print(numeros)                   # {1, 2, 3, 4, 5, 6, 7, 8, 9}
numeros.pop()
print(numeros)                   # {2, 3, 4, 5, 6, 7, 8, 9}
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".remove():")
numeros = {1, 2, 3, 1, 2, 4, 5, 5, 6, 7, 8, 9, 0}

print(numeros)                   # {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
numeros.remove(0)
print(numeros)                   # {1, 2, 3, 4, 5, 6, 7, 8, 9}
numeros.remove(1)
print(numeros)                   # {2, 3, 4, 5, 6, 7, 8, 9}
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".len():")
numeros = {1, 2, 3, 1, 2, 4, 5, 5, 6, 7, 8, 9, 0}

print(numeros)                   # {0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
print(len(numeros))              # 10
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("in:")
numeros = {1, 2, 3, 1, 2, 4, 5, 5, 6, 7, 8, 9, 0}

print(1 in numeros)               # True
print(10 in numeros)              # False
print("------//------//------//------//------//------//------//------//------//------//------//------//")