# 12-Dominando Funções Python
## 12.1-Dominando Funções Python
### 12.1.1-Dicionários
print("Exemplos de Funções:")
def exibir_mensagem():
    print("Olá mundo!")

def exibir_mensagem_2(nome):
    print(f"Seja bem vindo {nome}!")

def exibir_mensagem_3(nome="Anônimo"):
    print(f"Seja bem vindo {nome}!")

exibir_mensagem()
exibir_mensagem_2(nome="Guilherme")
exibir_mensagem_3()
exibir_mensagem_3("Chappie")
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Retorno da Função:")
def calcular_total(numeros):
    return sum(numeros)

def retorna_antecessor_e_sucessor(numero):
    antecessor = numero - 1
    sucessor = numero + 1
    return antecessor, sucessor

print(calcular_total([10, 20, 34]))                  # 64
print(retorna_antecessor_e_sucessor(10))             # (9, 11)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Argumentos Nomeados:")
def salvar_carro(marca, modelo, ano, placa):
    print(f"Carro inserido com sucesso! {marca}/{modelo}/{ano}/{placa}")

salvar_carro("Fiat", "Palio", 1999, "ABC-1234")
salvar_carro(marca="Fiat", modelo="Palio", ano=1999, placa="ABC-1234")
salvar_carro(**{"marca": "Fiat", "modelo": "Palio", "ano": 1999, "placa": "ABC-1234"})
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Args e Kwargs:")
def exibir_poema(data_extenso, *args, **kwargs):
    texto = "\n".join(args)
    meta_dados = "\n".join([f"{chave.title()}: {valor}" for chave, valor in kwargs.items()])
    mensagem = f"{data_extenso}\n\n{texto}\n\n{meta_dados}"
    print(mensagem)

exibir_poema("Sexta-feira, 26 de Agosto de 2022", "Zen of Python", "Beautiful is better than ugly", time="20s", autor="Tim Peters", ano=1999)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Parâmetros Somente por Posição:")
def exibir_mensagem():
    print("Olá mundo!")

def exibir_mensagem_2(nome):
    print(f"Seja bem vindo {nome}!")

def exibir_mensagem_3(nome="Anônimo"):
    print(f"Seja bem vindo {nome}!")

exibir_mensagem()
exibir_mensagem_2(nome="Guilherme")
exibir_mensagem_3()
exibir_mensagem_3("Chappie")
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Parâmetros Somente por Nome:")
def exibir_mensagem():
    print("Olá mundo!")

def exibir_mensagem_2(nome):
    print(f"Seja bem vindo {nome}!")

def exibir_mensagem_3(nome="Anônimo"):
    print(f"Seja bem vindo {nome}!")

exibir_mensagem()
exibir_mensagem_2(nome="Guilherme")
exibir_mensagem_3()
exibir_mensagem_3("Chappie")
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Objetos de Primeira Classe:")
def exibir_mensagem():
    print("Olá mundo!")

def exibir_mensagem_2(nome):
    print(f"Seja bem vindo {nome}!")

def exibir_mensagem_3(nome="Anônimo"):
    print(f"Seja bem vindo {nome}!")

exibir_mensagem()
exibir_mensagem_2(nome="Guilherme")
exibir_mensagem_3()
exibir_mensagem_3("Chappie")
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Escopo Local e Global:")
def exibir_mensagem():
    print("Olá mundo!")

def exibir_mensagem_2(nome):
    print(f"Seja bem vindo {nome}!")

def exibir_mensagem_3(nome="Anônimo"):
    print(f"Seja bem vindo {nome}!")

exibir_mensagem()
exibir_mensagem_2(nome="Guilherme")
exibir_mensagem_3()
exibir_mensagem_3("Chappie")
print("------//------//------//------//------//------//------//------//------//------//------//------//")