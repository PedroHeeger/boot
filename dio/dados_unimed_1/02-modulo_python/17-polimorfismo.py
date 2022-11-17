# 17-Conhecendo Polimorfismo em Python
## 17.1-Conhecendo Polimorfismo em Python
### 17.1.1-Polimorfismo:
print("Exemplos de Polimorfismo:")
print(len('python'))
print(len([10, 20, 30]))
print("------//------//------//------//------//------//------//------//------//------//------//------//")

### 17.1.2-Polimorfismo com Herança:
print("Polimorfismo com Herança:")
class Passaro:
    def voar(self):
        print("Voando...")

class Pardal(Passaro):
    def voar(self):
        super().voar()

class Avestruz(Passaro):
    def voar(self):
        print("Avestruz não pode voar")

# FIXME: exemplo ruim do uso de herança para "ganhar" o método voar
class Aviao(Passaro):
    def voar(self):
        print("Avião está decolando...")

def plano_de_voo(passaro):
    passaro.voar()

plano_de_voo(Pardal())
plano_de_voo(Avestruz())
plano_de_voo(Aviao())
print("------//------//------//------//------//------//------//------//------//------//------//------//")
