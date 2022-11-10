# 15-Aprendendo o Conceito de Herança com Python
## 15.1-Aprendendo o Conceito de Herança com Python
### 15.1.1-Herança em POO:
print("Exemplos de Herança:")
class A:
    pass

class B(A):
    pass
print("------//------//------//------//------//------//------//------//------//------//------//------//")

### 15.1.2-Simples e Múltipla:
print("Herança Simples:")
class A:
    pass

class B(A):
    pass
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Herança Múltipla:")
class A:
    pass

class B():
    pass

class C(A, B):
    pass
print("------//------//------//------//------//------//------//------//------//------//------//------//")

### 15.1.3-Herança Simples:
print("Herança Simples:")
class Veiculo:
    def __init__(self, cor, placa, numero_rodas):
        self.cor = cor
        self.placa = placa
        self.numero_rodas = numero_rodas
    
    def ligar_motor(self):
        print("Ligando o motor")
    
    def __str__(self):
        return self.cor

class Motocicleta(Veiculo):
    pass

class Carro(Veiculo):
    pass

class Caminhao(Veiculo):
    def __init__(self,  cor, placa, numero_rodas, carregado):
        super().__init__(cor, placa, numero_rodas)
        self.carregado = carregado

    def esta_carregado(self):
        print(f"{'Sim' if self.carregado else 'Não'} estou carregado")

moto = Motocicleta("preta", "ABC-1234", 2)
print(moto)
moto.ligar_motor()

carro = Carro("branco", "XDE-0098", 4)
carro.ligar_motor()

caminhao = Caminhao("roxo", "GFD-8712", 8, False)
caminhao.ligar_motor()
caminhao.esta_carregado()
print(caminhao)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

### 15.1.4-Herança Múltipla:
print("Herança Múltipla:")
class Animal:
    def __init__(self, nro_patas):
        self.nro_patas = nro_patas

    def __str__(self):
        return f"{self.__class__.__name__}: {', '.join([f'{chave}={valor}' for chave, valor in self.__dict__.items()])}"

class Mamifero(Animal):
    def __init__(self, cor_pelo, **kwargs):
        # super().__init__(nro_patas=kwargs["nro_patas"])
        super().__init__(**kwargs)
        self.cor_pelo = cor_pelo

class Ave(Animal):
    def __init__(self, cor_bico, **kw):
        # super().__init__(nro_patas=kw["nro_patas"])
        super().__init__(**kw)
        self.cor_bico = cor_bico

# class Cachorro(Mamifero):
#     pass
class Gato(Mamifero):
    pass
# class Leao(Mamifero):
#     pass
class Onitorrinco(Mamifero, Ave):
    pass

gato = Gato(nro_patas=4, cor_pelo="preta")
print(gato)

onitorrinco = Onitorrinco(nro_patas=2, cor_pelo="vermelho", cor_bico="laranja")
print(onitorrinco)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Herança Múltipla com o conceito MRO:")
class Animal:
    def __init__(self, nro_patas):
        self.nro_patas = nro_patas

    def __str__(self):
        return f"{self.__class__.__name__}: {', '.join([f'{chave}={valor}' for chave, valor in self.__dict__.items()])}"

class Mamifero(Animal):
    def __init__(self, cor_pelo, **kwargs):
        # super().__init__(nro_patas=kwargs["nro_patas"])
        super().__init__(**kwargs)
        self.cor_pelo = cor_pelo

    def __str__(self):
        return 'Mamifero'

class Ave(Animal):
    def __init__(self, cor_bico, **kw):
        # super().__init__(nro_patas=kw["nro_patas"])
        super().__init__(**kw)
        self.cor_bico = cor_bico

    def __str__(self):
        return "ave 42"



class Gato(Mamifero):
    pass
class Onitorrinco(Mamifero, Ave):
    def __init__(self, cor_bico, cor_pelo, nro_patas):
        # print(Onitorrinco.__mro__)
        print(Onitorrinco.mro())
        super().__init__(cor_pelo=cor_pelo, cor_bico=cor_bico, nro_patas=nro_patas)
    
    def __str__(self):
        return 'Onitorrinco'



onitorrinco = Onitorrinco(nro_patas=2, cor_pelo="vermelho", cor_bico="laranja")
print(onitorrinco)
print("------//------//------//------//------//------//------//------//------//------//------//------//")