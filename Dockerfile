# Usar a imagem base do Ubuntu
FROM ubuntu:latest

# Atualizar e instalar o gfortran e make
RUN apt-get update && apt-get install -y \
    gfortran \
    make \
    && rm -rf /var/lib/apt/lists/*

# Definir o diretório de trabalho
WORKDIR /usr/src/app

# Copiar o Makefile e os diretórios para dentro da imagem
COPY Makefile .
COPY src/ src/
COPY include/ include/
COPY build/ build/
COPY data/ data/

# Compilar o código
RUN make

# Definir o ponto de entrada para rodar o programa
CMD ["make", "run"]