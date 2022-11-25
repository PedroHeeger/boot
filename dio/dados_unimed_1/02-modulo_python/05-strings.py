# 2) Python para Cientistas de Dados (21)
## 2.5) Curso: Manipualçao de strings com Python (2)
### 2.5.1) Dominando Strings e Fatiamento
#### 2.5.1.1) Conhecendo métodos úteis da classe string
print("Formatação dos caracteres da String:")
curso = "pYtHon"
print(curso.upper())              # Converter para Maiúsculo
print(curso.lower())              # Converter para Minúsculo
print(curso.title())              # Converter para Título (primeira Maiúscula apenas)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Remover espaços da String:")
curso = "    Python "
print(curso.strip() + ".")              # Remove os espaços em branco tanto da esquerda como da direita
print(curso.lstrip() + ".")             # Remove os espaços em branco da esquerda
print(curso.rstrip() + ".")             # Remove os espaços em branco da direita
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Formatação da String:")
curso = "Python"
print(curso.center(10, "#"))
print(".".join(curso))             
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.5.1.2) Interpolação de variáveis
print("Old Style %:")
nome = "Guilherme"
idade = 28
profissao = "Programador"
linguagem = "Python"
print("Olá, me chamo %s. Eu tenho %d anos de idade, trabalho como %s e estou matriculado no curso de %s." % (nome, idade, profissao, linguagem))
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".format:")
print("Olá, me chamo {}. Eu tenho {} anos de idade, trabalho como {} e estou matriculado no curso de {}.".format(nome, idade, profissao, linguagem))
print("Olá, me chamo {1}. Eu tenho {3} anos de idade, trabalho como {2} e estou matriculado no curso de {0}.".format(linguagem, nome, profissao, idade))
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("f string:")
print(f"Olá, me chamo {nome}. Eu tenho {idade} anos de idade, trabalho como {profissao} e estou matriculado no curso de {linguagem}.")
print("Olá, me chamo {a1}. Eu tenho {a3} anos de idade, trabalho como {a2} e estou matriculado no curso de {a0}.".format(a0=linguagem, a1=nome, a2=profissao, a3=idade))
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("f string:")
PI = 3.14159
print(f"Valor de PI: {PI:.2f}")
print(f"Valor de PI: {PI:10.2f}")
print(f"Valor de PI: {PI:.5f}")
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Com uso do dicionário:")
dados = {"nome": "Guilherme", "idade": 28, "profissao": "Programador", "linguagem": "Java"}
print("Olá, me chamo {nome}. Eu tenho {idade} anos de idade, trabalho como {profissao} e estou matriculado no curso de {linguagem}.".format(**dados))
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.5.1.3) Fatiamento de string
print("Fatiamento de string:")
nome = "Guilherme Arthur de Carvalho"

print(nome[0])                # Primeiro Caractere
print(nome[:9])               # De 0 até 9 (8)
print(nome[10:])              # De 10 até o fim
print(nome[10:16])            # De 10 até 16 (15)
print(nome[10:16:2])          # De 10 até 16 (15), saltando de 2 em 2
print(nome [ : ])             # De 0 até o último
print(nome [ ::-1])           # Do último até o primeiro, será lido de trás para frente.
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.5.1.4) String múltiplas linhas
print("String múltiplas linhas:")
nome = "Guilherme"                  # String Simples
print(nome)

# String de Múltiplas Linhas (String Tripla)                                  
mensagem = f"""
    Olá meu nome é {nome},
Eu estou aprendendo Python
    Essa mensagem tem diferentes recuos.
"""
print(mensagem)
print("------//------//------//------//------//------//------//------//------//------//------//------//")