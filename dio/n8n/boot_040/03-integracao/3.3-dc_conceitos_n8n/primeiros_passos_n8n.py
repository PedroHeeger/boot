entrada = input()

def descrever_conceito(conceito):
  if conceito == "Instalação Local":
    return "Usar o N8N no PC via Docker, npm ou download direto."

  elif conceito == "Interface Web":
    return "Tela onde você cria e visualiza os fluxos do N8N."

  elif conceito == "Primeiro Workflow":
    return "Exemplo simples de fluxo com uma tarefa automática."

  elif conceito == "Editor de Fluxo":
    return "Área onde os nós são conectados para formar o fluxo."

print(descrever_conceito(entrada))