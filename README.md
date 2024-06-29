# Projeto de Análise Estatística em Fortran

Este projeto realiza uma análise estatística de dados de entrada usando Fortran. Ele lê os dados de um arquivo de texto,
calcula estatísticas básicas (média, mediana, desvio padrão) e gera um relatório com os resultados.

## Estrutura do Projeto

- `src/`: Contém os arquivos fonte em Fortran.
- `build/`: Diretório onde os arquivos objeto e o executável serão gerados.
- `include/`: Diretório para arquivos de cabeçalho (atualmente não utilizado).
- `data/`: Diretório contendo o arquivo de dados de exemplo (`sample_data.txt`).
- `Makefile`: Script Makefile para compilar e executar o projeto.

## Dependências

- Compilador Fortran (recomendado: `gfortran`).

## Como Compilar

Para compilar o projeto, execute:

```sh
make
```

## Como executar

Após compilar o projeto, execute:

```sh
make run
```

Isso irá rodar o executável gerado e exibir as estatísticas calculadas no console.

## Como limpar

Para limpar os arquivos compilados, execute:

```sh
make clean
```

Isso irá remover os arquivos objeto e o executável do diretório build.

## Estrutura do Código

`main.f90`

O arquivo principal que contém a lógica para ler os dados, calcular as estatísticas e imprimir os resultados.

`statistics.f90`

Módulo contendo sub-rotinas e funções para leitura de dados e cálculo de estatísticas:

- `read_data`: Lê os dados de um arquivo de texto.
- `mean`: Calcula a média dos dados.
- `median`: Calcula a mediana dos dados.
- `stddev`: Calcula o desvio padrão dos dados.
- `sort`: Ordena os dados.

## Exemplo de Arquivo de Dados

O arquivo de dados (data/sample_data.txt) deve conter uma lista de números, um por linha. Exemplo:

```
    1.0
    2.0
    3.0
    4.0
    5.0
```

## Licença 

Este projeto está licensiado sob a Licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## Contribuição

Sinta-se à vontade para contribuir com sugestões, melhorias e correções de bugs. Abra uma issue ou envie um pull request.

## Autor

Desenvolvido por [Ronaldo Uchoa](https://www.linkedin.com/in/devruchoa/)