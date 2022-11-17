# 20) Desafio de projeto: Descomplicando a criação de pacotes de processamento de imagens em Python (8)

Essa pasta **20-pacotes** é referente ao desafio de projeto de criação de pacotes de processamento de imagens em Python que está dentro do módulo 2 ([Python para Cientistas de Dados do bootcamp](/dio/dados_unimed_1/02-modulo_python)) do bootcamp [Geração Tech Unimed-BH - Ciência de Dados](/dio/dados_unimed_1).

Nela está contida, além desse arquivo de **README** que explica apenas sobre o desafio de projeto e os arquivos presente nessa pasta, uma outra pasta de nome **01-criacao_pacote** que é o pacote criado de processamento de imagem igual o que foi feito durante o desafio. Também contém um arquivo ipynb de nome "07_testando" que foi o código que foi feito no Google Colab para testar o pacote depois dele pronto e armazenado no servidor do TestPyPi.

Para acessar o pacote criado no servidor TestPyPi clique neste [link](https://test.pypi.org/project/pedro-image-processing/).

Dentro da pasta **01-criacao_pacote** temos as pastas e arquivos padrões que seguem o modelo explicado no desafio que são os arquivos **README**, **requirements.txt**, **setup.py** e a pasta __*pedro_image_processing*__ que é a pasta com os arquivos de código do nosso pacote. Além disso, temos mais três pastas **build**, **dist** e **pedro_image_processing.egg-info** que foram criadas no momento que executamos o comando que cria os dois tipos de distribuição de pacotes (wheel e sdist), elas não devem ser consideradas, pois o pacote já está disponível no servidor do TestPyPI.