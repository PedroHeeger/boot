# 8-Trabalhando com Listas em Python
## 8.1-Trabalhando com Listas em Python
### 8.1.1-Introdução: Teoria
### 8.1.2-Listas
print("Exemplos de listas:")
frutas = ["laranja", "maca", "uva"]
print(frutas)
frutas = []
print(frutas)
letras = list("python")
print(letras)
numeros = list(range(10))
print(numeros)
carro = ["Ferrari", "F8", 4200000, 2020, 2900, "São Paulo", True]
print(carro)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Acessando uma lista:")
frutas = ["laranja", "maçã", "uva"]
print(frutas[0])     # laranja
print(frutas[2])     # uva
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Índices negativos:")
frutas = ["laranja", "maca", "uva", "pera"]
print(frutas[-1])     # pera
print(frutas[-3])     # maçã
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Listas aninhadas:")
matriz = [
    [1, "a", 2],
    ["b", 3, 4],
    [6, 5, "c"]
]
print(matriz[0])          # [1, "a", 2]
print(matriz[0][0])       # 1
print(matriz[0][-1])      # 2
print(matriz[-1][-1])     # "c"
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Fatiamento de listas:")
lista = ["p", "y", "t", "h", "o", "n"]
print(lista[2:])                        # ["t", "h", "o", "n"]
print(lista[:2])                        # ["p", "y"]
print(lista[1:3])                       # ["y", "t"]
print(lista[0:3:2])                     # ["p", "t"]
print(lista[::])                        # ["p", "y", "t", "h", "o", "n"]
print(lista[::-1])                      # ["n", "o", "h", "t", "y", "p"]
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Iterar listas:")
carros = ["gol", "celta", "palio"]
for carro in carros:
    print(carro)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Função enumerate:")
carros = ["gol", "celta", "palio"]
for indice, carro in enumerate(carros):
    print(f'{indice}: {carro}')
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Compreensão de listas - Filtro:")
numeros = [1, 30, 21, 2, 9, 65, 34]
pares = []

for numero in numeros:
    if numero % 2 == 0:
        pares.append(numero)
print(pares)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Compreensão de listas - Filtro:")
numeros = [1, 30, 21, 2, 9, 65, 34]
pares = [numero for numero in numeros if numero % 2 == 0]
print(pares)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Compreensão de listas - Modificando valores:")
numeros = [1, 30, 21, 2, 9, 65, 34]
quadrado = []

for numero in numeros:
    quadrado.append(numero**2)
print(quadrado)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Compreensão de listas - Modificando valores:")
numeros = [1, 30, 21, 2, 9, 65, 34]
quadrado = [numero**2 for numero in numeros]
print(quadrado)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

### 8.1.3-Métodos da classe List
print(".append():")
lista = []
lista.append(1)
lista.append("Python")
lista.append([40,30,20])
print(lista)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".clear():")
lista = [1, "Python", [40,30,20]]
lista.clear()
print(lista)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".copy():")
lista = [1, "Python", [40,30,20]]
lista2 = lista.copy()
print(id(lista), id(lista2))
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".count():")
cores = ["vermelho", "azul", "verde", "azul"]
print(cores.count("vermelho"))              # 1
print(cores.count("azul"))                  # 2
print(cores.count("verde"))                 # 1
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".extend():")
linguagens = ["python", "js", "c"]
print(linguagens)
linguagens.extend(["java", "csharp"])
print(linguagens)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".index():")
linguagens = ["python", "js", "c", "java", "csharp"]
print(linguagens.index("java"))                # 3
print(linguagens.index("python"))              # 0
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".pop():")
linguagens = ["python", "js", "c", "java", "csharp"]
linguagens.pop()             # csharp
print(linguagens)
linguagens.pop()             # java
print(linguagens)
linguagens.pop()             # c
print(linguagens)
linguagens.pop(0)            # python
print(linguagens)

print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".remove():")
linguagens = ["python", "js", "c", "java", "csharp", "c"]
linguagens.remove("c")
print(linguagens)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".reverse():")
linguagens = ["python", "js", "c", "java", "csharp"]
linguagens.reverse()
print(linguagens)                    # ["csharp", "java", "c", "js", "python"]
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".sort():")
linguagens = ["python", "js", "c", "java", "csharp"]
linguagens.sort()
print(linguagens)                                        # ["c", "csharp", "java", "js", "python"]

linguagens = ["python", "js", "c", "java", "csharp"]
linguagens.sort(reverse=True)                            # ["python", "js", "java", "csharp", "c"]
print(linguagens)

linguagens = ["python", "js", "c", "java", "csharp"]
linguagens.sort(key=lambda x: len(x))                    # ["c", "js", "java", "python", "csharp"]
print(linguagens)

linguagens = ["python", "js", "c", "java", "csharp"]
linguagens.sort(key=lambda x: len(x), reverse=True)      # ["python", "csharp", "java", "js", "c"]
print(linguagens)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".len():")
linguagens = ["python", "js", "c", "java", "csharp"]
print(len(linguagens))                            # 5
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".sorted():")
linguagens = ["python", "js", "c", "java", "csharp"]
print(sorted(linguagens))                                                 # ["c", "csharp", "java", "js", "python"]

linguagens = ["python", "js", "c", "java", "csharp"]
print(sorted(linguagens, reverse=True))                                   # ["python", "js", "java", "csharp", "c"]

linguagens = ["python", "js", "c", "java", "csharp"]
print(sorted(linguagens, key=lambda x: len(x)))                           # ["c", "js", "java", "python", "csharp"]

linguagens = ["python", "js", "c", "java", "csharp"]
print(sorted(linguagens, key=lambda x: len(x), reverse=True))             # ["python", "csharp", "java", "js", "c"]
print("------//------//------//------//------//------//------//------//------//------//------//------//")