# 2) Python para Cientistas de Dados (21)
## 2.14) Curso: Introdução à Programação Orientada a Objetos (POO) com Python (2)
### 2.14.1) Introdução à Programação Orientada a Objetos (POO) com Python (4)
#### 2.14.1.1) O que é Orientação a Objetos (OO)? Teoria.
#### 2.14.1.2) Os conceitos de Classes e Objetos
print("Exemplos de Classe:")
class Cachorro:
    def __init__(self, nome, cor, acordado=True):
        self.nome = nome
        self.cor = cor
        self.acordado = acordado
    
    def latir(self):
        print("Auau")
    
    def dormir(self):
        self.acordado = False
        print("Zzzzz...")
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Exemplos de Objetos:")
cao_1 = Cachorro("chappie", "amarelo", False)
cao_2 = Cachorro("Aladim", "branco e preto")

cao_1.latir()

print(cao_2.acordado)
cao_2.dormir()
print(cao_2.acordado)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.14.1.3) Criando seu primeiro Programa com POO
print("Primeiro Programa POO:")
class Bicicleta:
    def __init__(self, cor, modelo, ano, valor):
        self.cor = cor
        self.modelo = modelo
        self.ano = ano
        self.valor = valor
    
    def buzinar(self):
        print("Plim pilm...")
    
    def parar(self):
        print("Parando bicileta...")
        print("Bicicleta parada!")

    def correr(self):
        print("Vrummmm...")

b1 = Bicicleta("vermelho", "caloi", 2022, 600)
b1.buzinar()
b1.correr()
b1.parar()
print(b1.cor, b1.modelo, b1.ano, b1.valor)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Primeiro Programa POO:")
class Bicicleta:
    def __init__(self, cor, modelo, ano, valor):
        self.cor = cor
        self.modelo = modelo
        self.ano = ano
        self.valor = valor
    
    def buzinar(self):
        print("Plim pilm...")
    
    def parar(self):
        print("Parando bicileta...")
        print("Bicicleta parada!")

    def correr(self):
        print("Vrummmm...")
    
    def get_cor(self):
        return self.cor

b2 = Bicicleta("verde", "monark", 2000, 189)
Bicicleta.buzinar(b2)
b2.buzinar()
print(b2.get_cor())
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Primeiro Programa POO:")
class Bicicleta:
    def __init__(self, cor, modelo, ano, valor):
        self.cor = cor
        self.modelo = modelo
        self.ano = ano
        self.valor = valor
    
    def buzinar(self):
        print("Plim pilm...")
    
    def parar(self):
        print("Parando bicileta...")
        print("Bicicleta parada!")

    def correr(self):
        print("Vrummmm...")
    
    def __str__(self):
        return f"Bicicleta: cor={self.cor}, modelo={self.modelo}, ano={self.ano}, valor={self.valor}"

b2 = Bicicleta("verde", "monark", 2000, 189)
print(b2)
print("------//------//------//------//------//------//------//------//------//------//------//------//")


print("Primeiro Programa POO:")
class Bicicleta:
    def __init__(self, cor, modelo, ano, valor, aro=18):
        self.cor = cor
        self.modelo = modelo
        self.ano = ano
        self.valor = valor
        self.aro = aro
    
    def buzinar(self):
        print("Plim pilm...")
    
    def parar(self):
        print("Parando bicileta...")
        print("Bicicleta parada!")

    def correr(self):
        print("Vrummmm...")
    
    def __str__(self):
        return f"{self.__class__.__name__}: {', '.join([f'{chave}={valor}' for chave, valor in self.__dict__.items()])}"

b2 = Bicicleta("verde", "monark", 2000, 189)
print(b2)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.14.1.4) Construtores e Destrutores
print("Exemplo de Construtor:")
class Cachorro:
    def __init__(self, nome, cor, acordado=True):
        self.nome = nome
        self.cor = cor
        self.acordado = acordado

print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Exemplo de Destrutor:")
class Cachorro:
    def __del__(self):
        print("Destruindo a instância")

c = Cachorro()
del c
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Exemplo de Destrutor:")
class Cachorro:
    def __init__(self, nome, cor, acordado=True):
        print("Inicializando a classe...")
        self.nome = nome
        self.cor = cor
        self.acordado = acordado

    def __del__(self):
        print("Removendo a instância da classe.")
    
    def falar(self):
        print("auau")

def criar_cachorro():
    c = Cachorro("Zeus", "Branco e preto", False)
    print(c.nome)

c = Cachorro("Chappie", "amarelo")
c.falar()
del c
criar_cachorro()
print("------//------//------//------//------//------//------//------//------//------//------//------//")