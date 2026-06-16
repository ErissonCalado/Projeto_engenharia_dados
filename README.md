# Projeto de Engenharia de Dados — Pipeline de Varejo

Este projeto simula um pipeline de Engenharia de Dados para um cenário de varejo, utilizando dados de clientes, produtos, vendas e preços de concorrentes.

O objetivo é construir um fluxo completo de dados, desde arquivos armazenados em um Data Lake até a criação de modelos analíticos com dbt em arquitetura medalhão.

## Objetivo do projeto

O projeto foi desenvolvido para demonstrar habilidades práticas em Engenharia de Dados, incluindo:

* Ingestão de dados a partir de arquivos Parquet;
* Leitura de dados em Data Lake compatível com S3;
* Carregamento de dados em PostgreSQL/Supabase;
* Organização de consultas SQL analíticas;
* Modelagem com dbt em arquitetura medalhão;
* Separação de responsabilidades em código Python;
* Uso de variáveis de ambiente para proteger credenciais;
* Versionamento com Git e GitHub.

## Arquitetura

Fluxo geral do projeto:

```text
Arquivos CSV / Dados brutos
        ↓
Arquivos Parquet no Data Lake
        ↓
Pipeline Python
        ↓
PostgreSQL / Supabase
        ↓
Consultas SQL analíticas
        ↓
dbt Cloud
        ↓
Arquitetura Medalhão
Bronze → Silver → Gold
```

## Tecnologias utilizadas

* Python
* Pandas
* Boto3
* PyArrow
* SQLAlchemy
* PostgreSQL
* Supabase Storage
* Supabase Database
* SQL
* dbt Cloud
* Git e GitHub
* uv

## Estrutura do projeto

```text
Projeto_engenharia_dados/
├── data/
├── src/
│   ├── config.py
│   ├── ler_datalake.py
│   ├── database.py
│   └── main.py
├── sql/
│   ├── README.md
│   ├── analise_temporal.sql
│   ├── comparacao_precos_concorrencia.sql
│   ├── concorrente_mais_barato.sql
│   ├── produtos_criticos_preco.sql
│   ├── produtos_maior_receita.sql
│   ├── produtos_mais_vendidos.sql
│   ├── receita_por_canal.sql
│   ├── receita_por_categoria.sql
│   ├── segmentacao_clientes.sql
│   └── top_clientes.sql
├── dbt/
│   ├── models/
│   │   ├── bronze/
│   │   ├── silver/
│   │   └── gold/
│   ├── analyses/
│   ├── macros/
│   ├── seeds/
│   ├── snapshots/
│   ├── tests/
│   ├── dbt_project.yml
│   └── README.md
├── .env.example
├── .gitignore
├── pyproject.toml
├── uv.lock
└── README.md
```

## Camadas do projeto

### 1. Data Lake

Os arquivos `.parquet` são armazenados no Supabase Storage, acessado por uma API compatível com S3.

Arquivos utilizados:

* `clientes.parquet`
* `produtos.parquet`
* `vendas.parquet`
* `preco_competidores.parquet`

### 2. Pipeline Python

A pasta `src/` contém o pipeline responsável por:

1. Ler as variáveis de ambiente;
2. Conectar ao Data Lake;
3. Ler os arquivos Parquet;
4. Conectar ao PostgreSQL/Supabase;
5. Salvar os dados como tabelas no banco;
6. Validar a quantidade de linhas carregadas.

Arquivos principais:

| Arquivo           | Responsabilidade                              |
| ----------------- | --------------------------------------------- |
| `config.py`       | Lê as variáveis de ambiente do arquivo `.env` |
| `ler_datalake.py` | Conecta ao Data Lake e lê arquivos Parquet    |
| `database.py`     | Conecta ao PostgreSQL e salva DataFrames      |
| `main.py`         | Orquestra o pipeline completo                 |

### 3. SQL Analytics

A pasta `sql/` contém consultas analíticas criadas para explorar os dados carregados no PostgreSQL/Supabase.

As análises respondem perguntas como:

* Quais produtos vendem mais?
* Quais produtos geram mais receita?
* Quais clientes possuem maior valor para o negócio?
* Quais canais geram mais faturamento?
* Quais categorias têm melhor desempenho?
* Quais produtos estão acima ou abaixo do preço dos concorrentes?

### 4. dbt — Arquitetura Medalhão

A pasta `dbt/` contém os modelos dbt organizados em arquitetura medalhão.

Camadas:

| Camada | Descrição                                                          |
| ------ | ------------------------------------------------------------------ |
| Bronze | Modelos próximos às tabelas brutas carregadas pelo pipeline Python |
| Silver | Modelos tratados, padronizados e tipados                           |
| Gold   | Modelos analíticos finais para consumo                             |

Fluxo dbt:

```text
Tabelas brutas no PostgreSQL
        ↓
Bronze
        ↓
Silver
        ↓
Gold
```

## Configuração do ambiente

Este projeto utiliza variáveis de ambiente para proteger credenciais.

Crie um arquivo `.env` com base no `.env.example`:

```bash
cp .env.example .env
```

Variáveis necessárias:

```env
S3_ENDPOINT_URL=
AWS_REGION=
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
BUCKET_NAME=
DATABASE_URL=
```

O arquivo `.env` não deve ser enviado ao GitHub.

## Instalação das dependências

Este projeto utiliza `uv` para gerenciamento do ambiente Python.

Para instalar as dependências:

```bash
uv sync
```

Ou, caso esteja configurando do zero:

```bash
uv add boto3 pandas pyarrow python-dotenv sqlalchemy psycopg2-binary
```

## Como executar o pipeline Python

A partir da raiz do projeto, execute:

```bash
uv run python src/main.py
```

Resultado esperado:

```text
Iniciando pipeline Data Lake -> PostgreSQL...

Conexão com o banco de dados bem-sucedida!

Lendo arquivos Parquet do Data Lake...

Salvando tabelas no PostgreSQL...

Tabela 'clientes' salva com sucesso.
Tabela 'produtos' salva com sucesso.
Tabela 'vendas' salva com sucesso.
Tabela 'preco_competidores' salva com sucesso.

Pipeline finalizado com sucesso!
```

## Como executar as consultas SQL

As consultas da pasta `sql/` podem ser executadas em:

* SQL Editor do Supabase;
* DBeaver;
* pgAdmin;
* DataGrip;
* outro cliente PostgreSQL.

As tabelas precisam estar carregadas no banco antes da execução das consultas.

## Execução do dbt

A etapa dbt foi desenvolvida no dbt Cloud, conectada ao banco PostgreSQL/Supabase.

O dbt organiza as transformações analíticas nas camadas:

```text
Bronze → Silver → Gold
```

Os modelos estão versionados na pasta `dbt/`.

## Principais aprendizados

Este projeto demonstra conhecimentos em:

* Criação de pipeline de dados com Python;
* Leitura de arquivos Parquet em Data Lake;
* Uso de Storage compatível com S3;
* Integração com PostgreSQL/Supabase;
* Escrita de consultas SQL analíticas;
* Organização de projeto com múltiplas camadas;
* Modelagem com dbt;
* Arquitetura medalhão;
* Boas práticas com `.env`, `.env.example` e `.gitignore`;
* Versionamento de projeto de dados no GitHub.

## Status do projeto

Projeto em desenvolvimento e evolução contínua.

Próximas melhorias possíveis:

* Adicionar testes de qualidade de dados no dbt;
* Documentar os modelos dbt com `schema.yml`;
* Criar métricas finais na camada Gold;
* Adicionar imagens da arquitetura;
* Adicionar exemplos de resultados das consultas SQL;
* Automatizar a execução do pipeline.
