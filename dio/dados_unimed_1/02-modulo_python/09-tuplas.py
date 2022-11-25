# 2) Python para Cientistas de Dados (21)
## 2.9) Curso: Conhecendo Tuplas em Python (2)
### 2.9.1) Conhecendo Tuplas em Python
#### 2.9.1.1) Tuplas
print("Exemplos de tuplas:")
frutas = ("laranja", "pera", "uva",)
print(frutas)
frutas = ()
print(frutas)
letras = tuple("python")
print(letras)
numeros = tuple([1, 2, 3, 4])
print(numeros)
pais = ("Brasil",)
print(pais)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Acesso direto:")
frutas = ("maçã", "laranja", "uva", "pera",)
print(frutas[0])               # maçã
print(frutas[2])               # uva
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Índices negativos:")
frutas = ("maçã", "laranja", "uva", "pera",)
print(frutas[-1])               # pera
print(frutas[-3])               # laranja
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Tuplas aninhadas:")
matriz = (
    (1, "a", 2),
    ("b", 3, 4),
    (6, 5, "c"),
)

print(matriz[0])                   # (1, "a", 2)
print(matriz[0][0])                # 1
print(matriz[0][-1])               # 2
print(matriz[-1][-1])              # "c"
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Fatiamento:")
tupla = ("p", "y", "t", "h", "o", "n")

print(tupla[2:])                        # ["t", "h", "o", "n"]
print(tupla[:2])                        # ["p", "y"]
print(tupla[1:3])                       # ["y", "t"]
print(tupla[0:3:2])                     # ["p", "t"]
print(tupla[::])                        # ["p", "y", "t", "h", "o", "n"]
print(tupla[::-1])                      # ["n", "o", "h", "t", "y", "p"]
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Iterar tuplas:")
carros = ("gol", "celta", "palio")
for carro in carros:
    print(carro)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Função enumerate:")
carros = ("gol", "celta", "palio")
for indice, carro in enumerate(carros):
    print(f'{indice}: {carro}')
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".count():")
cores = ("vermelho", "azul", "verde", "azul")
print(cores.count("vermelho"))              # 1
print(cores.count("azul"))                  # 2
print(cores.count("verde"))                 # 1
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".index():")
linguagens = ("python", "js", "c", "java", "csharp")
print(linguagens.index("java"))                # 3
print(linguagens.index("python"))              # 0
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".len():")
linguagens = ("python", "js", "c", "java", "csharp")
print(len(linguagens))                            # 5
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("??:")
carros = ("gol")
print(isinstance(carros, tuple))                            # False
print("------//------//------//------//------//------//------//------//------//------//------//------//")