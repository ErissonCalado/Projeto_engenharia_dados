# dbt — Arquitetura Medalhão

Esta etapa organiza as transformações analíticas usando dbt.

## Camadas

- Bronze: modelos próximos das tabelas brutas carregadas pelo pipeline Python.
- Silver: modelos tratados, padronizados e tipados.
- Gold: modelos analíticos finais para consumo.

## Fluxo do projeto

Data Lake → Python → PostgreSQL/Supabase → dbt Bronze → dbt Silver → dbt Gold

## Modelos

- Bronze: leitura das tabelas brutas `clientes`, `produtos`, `vendas` e `preco_competidores`
- Silver: padronização, tratamento de tipos e limpeza
- Gold: tabelas analíticas de vendas, clientes, produtos e preços