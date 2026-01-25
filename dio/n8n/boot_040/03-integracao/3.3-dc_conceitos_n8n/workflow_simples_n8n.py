entrada = input()

def descrever_workflow(conceito):
  if conceito == "Gatilho":
    return "Inicia o fluxo, como horário ou recebimento de dados."

  elif conceito == "Ação":
    return "Executa uma tarefa, como enviar ou receber dados."

  elif conceito == "Conexão":
    return "Liga dois nós, definindo a ordem das execuções."

  elif conceito == "Execução":
    return "Momento em que o fluxo roda e mostra o resultado."

print(descrever_workflow(entrada))