# 2) Python para Cientistas de Dados (21)
## 2.11) Curso: Aprendendo a Utilizar Dicionários em Python (2)
### 2.11.1) Aprendendo a Utilizar Dicionários em Python (2)
#### 2.11.1.1) Dicionários: Criação e acesso de dados
print("Exemplos de Dicionários:")
pessoa = {"nome": "Guilherme", "idade": 28}
print(pessoa)

pessoa = dict(nome="Guilherme", idade=28)
print(pessoa)

pessoa["telefone"] = "3333-1234"
print(pessoa)                       # {"nome": "Guilherme", "idade": 28, "telefone": 3333-1234}
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Acesso aos dados:")
dados = {"nome": "Guilherme", "idade": 28, "telefone": "3333-1234"}
print(dados)

print(dados["nome"])                    # "Guilherme"
print(dados["idade"])                   # 28
print(dados["telefone"])                # "3333-1234"
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Alterando os dados:")
dados = {"nome": "Guilherme", "idade": 28, "telefone": "3333-1234"}
print(dados)

dados["nome"] = "Maria"
dados["idade"] = 18
dados["telefone"] = "9988-1781"
print(dados)                                  # {"nome": "Maria", "idade": 18, "telefone": "9988-1781"}
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Dicionários aninhados:")
contatos = {
    "guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"},
    "giovanna@gmail.com": {"nome": "Giovanna", "telefone": "3443-2121"},
    "chappie@gmail.com": {"nome": "Chappie", "telefone": "3344-9871"},
    "melaine@gmail.com": {"nome": "Melaine", "telefone": "3333-7766"},
}
print(contatos)
print(contatos["giovanna@gmail.com"]["telefone"])                     # "3443-2121"
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Iterar dicionários:")
contatos = {
    "guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"},
    "giovanna@gmail.com": {"nome": "Giovanna", "telefone": "3443-2121"},
    "chappie@gmail.com": {"nome": "Chappie", "telefone": "3344-9871"},
    "melaine@gmail.com": {"nome": "Melaine", "telefone": "3333-7766"},
}

for chave in contatos:
    print(chave, contatos[chave])
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("Iterar dicionários:")
contatos = {
    "guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"},
    "giovanna@gmail.com": {"nome": "Giovanna", "telefone": "3443-2121"},
    "chappie@gmail.com": {"nome": "Chappie", "telefone": "3344-9871"},
    "melaine@gmail.com": {"nome": "Melaine", "telefone": "3333-7766"},
}

for chave, valor in contatos.items():
    print(chave, valor)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

#### 2.11.1.2) Métodos da classe dict
print(".clear():")
contatos = {
    "guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"},
    "giovanna@gmail.com": {"nome": "Giovanna", "telefone": "3443-2121"},
    "chappie@gmail.com": {"nome": "Chappie", "telefone": "3344-9871"},
    "melaine@gmail.com": {"nome": "Melaine", "telefone": "3333-7766"},
}

contatos.clear()
print(contatos)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".copy():")
contatos = {
    "guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"},
    "giovanna@gmail.com": {"nome": "Giovanna", "telefone": "3443-2121"},
    "chappie@gmail.com": {"nome": "Chappie", "telefone": "3344-9871"},
    "melaine@gmail.com": {"nome": "Melaine", "telefone": "3333-7766"},
}

contatos2 = contatos.copy()
print(id(contatos), id(contatos2))
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".fromkeys():")
print(dict.fromkeys(["nome", "telefone"]))                       # {"nome": None, "telefone": None}
print(dict.fromkeys(["nome", "telefone"], "vazio"))              # {"nome": "vazio", "telefone": "vazio"}
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".get():")
contatos = {
    "guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"}
}

# print(contatos["chave"])               # KeyError: Não existe nenhuma chave no dicionário com nome "chave"
print(contatos.get("chave"))             # None
print(contatos.get("chave", {}))         # {}
print(contatos.get("guilherme@gmail.com", {}))         # {"guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"}}
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".items():")
contatos = {
    "guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"}
}

print(contatos.items())            # dict_items([('guilherme@gamil.com', {'nome': 'Guilherme', 'telefone': '3333-2221'})])
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".items():")
contatos = {
    "guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"}
}

print(contatos.items())            # dict_items([('guilherme@gamil.com', {'nome': 'Guilherme', 'telefone': '3333-2221'})])
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".keys():")
contatos = {
    "guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"}
}

print(contatos.keys())           # dict_keys(['guilherme@gamil.com'])
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".pop():")
contatos = {
    "guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"}
}

contatos.pop("guilherme@gmail.com")
print(contatos)

contatos.pop("guilherme@gmail.com", "não encontrou")
print(contatos)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".popitem():")
contatos = {
    "guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"}
}

contatos.popitem()
print(contatos)
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".setdefault():")
contato = {"nome": "Guilherme", "telefone": "3333-2221"}

contato.setdefault("nome", "Giovanna")              # "Guilherme"
print(contato)                                      # {"nome": "Guilherme", "telefone": "3333-2221"}

contato.setdefault("idade", 28)                     # 28
print(contato)                                      # {"nome": "Guilherme", "telefone": "3333-2221", "idade": 28}
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".update():")
contatos = {
    "guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"}
}

contatos.update({"guilherme@gmail.com": {"nome": "Gui"}})
print(contatos)                         # {'guilherme@gmail.com': {'nome': 'Gui'}}

contatos.update({"giovannna@gmail.com": {"nome": "Giovanna", "telefone": "3322-8181"}})
print(contatos)                         # {'guilherme@gmail.com': {'nome': 'Gui'}. 'giovanna@gmail.com': {'nome': 'Giovanna', 'telefone': '3322-8181'}}
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".values():")
contatos = {
    "guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"},
    "giovanna@gmail.com": {"nome": "Giovanna", "telefone": "3443-2121"},
    "chappie@gmail.com": {"nome": "Chappie", "telefone": "3344-9871"},
    "melaine@gmail.com": {"nome": "Melaine", "telefone": "3333-7766"},
}

print(contatos.values())
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print("in:")
contatos = {
    "guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"},
    "giovanna@gmail.com": {"nome": "Giovanna", "telefone": "3443-2121"},
    "chappie@gmail.com": {"nome": "Chappie", "telefone": "3344-9871"},
    "melaine@gmail.com": {"nome": "Melaine", "telefone": "3333-7766"},
}

print("guilherme@gmail.com" in contatos)                          # True
print("megui@gmail.com" in contatos)                              # False
print("idade" in contatos["guilherme@gmail.com"])                 # False
print("telefone" in contatos["giovanna@gmail.com"])               # True
print("------//------//------//------//------//------//------//------//------//------//------//------//")

print(".del():")
contatos = {
    "guilherme@gmail.com": {"nome": "Guilherme", "telefone": "3333-2221"},
    "giovanna@gmail.com": {"nome": "Giovanna", "telefone": "3443-2121"},
    "chappie@gmail.com": {"nome": "Chappie", "telefone": "3344-9871"},
    "melaine@gmail.com": {"nome": "Melaine", "telefone": "3333-7766"},
}

del contatos["guilherme@gmail.com"]["telefone"]
del contatos["chappie@gmail.com"]
print(contatos)
print("------//------//------//------//------//------//------//------//------//------//------//------//")