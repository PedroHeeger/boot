# 2) Python para Cientistas de Dados (21)
## 2.18) Curso: Ampliando o conhecimento em POO com Python (2)
### 2.18.1) Ampliando o conhecimento em POO (4)
#### 2.18.1.1) Variáveis de classe e Variáveis de instância
print("Variáveis de classe e de instância:")
class Estudante:
    escola = "DIO"                             # Variável de Classe

    def __init__(self, nome, matricula):       # Variável de Instância
        self.nome = nome
        self.matricula = matricula
    
    def __str__(self):
        return f"{self.nome} ({self.matricula} - {self.escola})"
    
def mostrar_valores(*objs):
    for obj in objs:
        print(obj)

aluno_1 = Estudante("Guilherme", 56451)
aluno_2 = Estudante("Giovanna", 17323)
mostrar_valores(aluno_1, aluno_2)
# print(aluno_1)
# print(aluno_2)

aluno_1.matricula = 3
mostrar_valores(aluno_1, aluno_2)

Estudante.escola = "Python"
mostrar_valores(aluno_1, aluno_2)

aluno_3 = Estudante("Chappie", 4)
mostrar_valores(aluno_1, aluno_2)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.18.1.2) Métodos de classe e estático:
print("Métodos de classe:")
class Pessoa:
    def __init__(self, nome=None, idade=None):
        self.nome = nome
        self.idade = idade
    
    @classmethod
    def criar_de_data_nascimento(cls, ano, mes, dia, nome):
        # print(cls)
        idade = 2022 - ano
        return cls(nome, idade)

p = Pessoa("Guilherme", 28)
# print(p.nome, p.idade)

p2 = Pessoa.criar_de_data_nascimento(1994, 3, 21, "Guilherme")
print(p2.nome, p2.idade)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Métodos estático:")
class Pessoa:
    def __init__(self, nome=None, idade=None):
        self.nome = nome
        self.idade = idade
    
    @classmethod
    def criar_de_data_nascimento(cls, ano, mes, dia, nome):
        # print(cls)
        idade = 2022 - ano
        return cls(nome, idade)
    
    @staticmethod
    def e_maior_idade(idade):
        return idade >= 18


print(Pessoa.e_maior_idade(18))
print(Pessoa.e_maior_idade(8))
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.18.1.3) O que são Interfaces? Teoria.
#### 2.18.1.4) Classes Abstratas
print("Classes abstratas:")
from abc import ABC, abstractmethod

class ControleRemoto(ABC):
    @abstractmethod
    def ligar(self):
        pass
    
    @abstractmethod
    def desligar(self):
        pass

    @property
    @abstractmethod
    def marca(self):
        pass

class ControleTV(ControleRemoto):
    def ligar(self):
        print("Ligando a TV...")
        print("Ligada!")
    
    def desligar(self):
        print("Desligando a TV...")
        print("Desligado!")
    
    @property
    def marca(self):
        return "Samsung"

class ControleArCondicionado(ControleRemoto):
    def ligar(self):
        print("Ligando o Ar Condicionado...")
        print("Ligado!")

    def desligar(self):
        print("Desligando o Ar Condicionado...")
        print("Desligado!")

    @property
    def marca(self):
        return "LG"




controle_tv = ControleTV()
controle_tv.ligar()
controle_tv.desligar()
print(controle_tv.marca)

controle_ar = ControleArCondicionado()
controle_ar.ligar()
controle_ar.desligar()
print(controle_ar.marca)
print("------//------//------//------//------//------//------//------//------//------//------//------//")