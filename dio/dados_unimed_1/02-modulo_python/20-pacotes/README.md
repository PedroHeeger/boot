* **Plataforma**: [DIO (Digital Inovation One)](/dio/)
* **Bootcamp**: [Geração Tech Unimed-BH - Ciência de Dados: Básico; 126 Hrs](/dio/dados_unimed_1/)
* **Módulo_Bootcamp**: [2) Python para Cientistas de Dados (21)](/dio/dados_unimed_1/02-modulo_python/)
# 2.20) Desafio de projeto: Descomplicando a criação de pacotes de processamento de imagens em Python (8)
## Objetivos
Criar o seu primeiro pacote de processamento de imagens em Python e disponibilizá-lo no repositório TestPypi. Assim você poderá reutilizá-lo facilmente e compartilhá-lo com outras pessoas. Será realizado um exemplo de pacote para processamento de imagens.
## Tecnologias
* Linguagem de Programação: Python
* Ambiente de Desenvolvimento: Jupyter Notebook; VS Code; Google Colab
* Bibliotecas: setuptools; scikit-image; numpy; matplotlib

## Índice
* 2.20.1.1) Parte 1
* 2.20.1.2) Parte 2
* 2.20.1.3) Parte 3
* 2.20.1.4) Parte 4
* 2.20.1.5) Parte 5
* 2.20.1.6) Parte 6
* [2.20.1.7) Parte 7](/dio/dados_unimed_1/02-modulo_python/20-pacotes/07_testando.ipynb)
* 2.20.1.8) Materiais de apoio
## Desenvolvimento
Nesta pasta **20-pacotes** está contida uma outra pasta de nome **01-criacao_pacote** que é o pacote criado de processamento de imagem igual o que foi feito durante o desafio. Também contém um arquivo ipynb de nome **07_testando** que foi o código que foi feito no Google Colab para testar o pacote depois dele pronto e armazenado no servidor do TestPyPi.

Para acessar o pacote criado no servidor TestPyPi clique neste [link](https://test.pypi.org/project/pedro-image-processing/).

Dentro da pasta **01-criacao_pacote** temos as pastas e arquivos padrões que seguem o modelo explicado no desafio que são os arquivos **README**, **requirements.txt**, **setup.py** e a pasta __*pedro_image_processing*__ que é a pasta com os arquivos de código do nosso pacote. Além disso, temos mais três pastas **build**, **dist** e **pedro_image_processing.egg-info** que foram criadas no momento que executamos o comando que cria os dois tipos de distribuição de pacotes (wheel e sdist), elas não devem ser consideradas, pois o pacote já está disponível no servidor do TestPyPI.