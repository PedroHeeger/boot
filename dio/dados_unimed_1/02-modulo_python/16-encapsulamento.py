# 16-Aplicando Encapsulamento em Python
## 16.1-Aplicando Encapsulamento em Python
### 16.1.1-Encapsulamento: Teoria.
### 16.1.2-Recursos Públicos e Privados:
print("Exemplos de Recursos Públicos:")
class Conta:
    def __init__(self, saldo=0):
        self.saldo = saldo
    
    def depositar(self, valor):
        pass

    def sacar(self, valor):
        pass
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Exemplos de Recursos Privados:")
class Conta:
    def __init__(self, nro_agencia, saldo=0):
        self._saldo = saldo
        self.nro_agencia = nro_agencia
    
    def depositar(self, valor):
        self._saldo += valor

    def sacar(self, valor):
        self._saldo -= valor

    def mostrar_saldo(self):
        return self._saldo

conta = Conta("0001", 200)
print(conta._saldo)
conta.depositar(100)
print(conta._saldo)
print(conta.nro_agencia)
print(conta.mostrar_saldo())
print("------//------//------//------//------//------//------//------//------//------//------//------//")

### 16.1.3-Propriedades:
print("Property:")
class Foo:
    def __init__(self, x=None):
        self._x = x
    
    @property
    def x(self):
        return self._x or 0
    
    @x.setter
    def x(self, value):
        _x = self._x or 0
        _value = value or 0
        self._x = _x + _value
    
    @x.deleter
    def x(self):
        self._x = -1

foo = Foo(10)
print(foo.x)
foo.x = 10
print(foo.x)
del foo.x
print(foo.x)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Property:")
class Pessoa:
    def __init__(self, nome, ano_nascimento):
        self._nome = nome
        self._ano_nascimento = ano_nascimento

    @property
    def nome(self):
        return self._nome
    
    @property
    def idade(self):
        _ano_atual = 2022
        return _ano_atual - self._ano_nascimento
    
    # Outras linguagens usam assim:
    def get_nome(self):
        return self._nome
    
    def get_idade(self):
        return 2022 - self._ano_nascimento
    
pessoa = Pessoa("Guilherme", 1994)
print(f"Nome: {pessoa.nome} \tIdade: {pessoa.idade}")
print("------//------//------//------//------//------//------//------//------//------//------//------//")