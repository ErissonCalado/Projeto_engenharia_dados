SELECT
    canal_venda,
    ROUND(SUM(quantidade * preco_unitario)::numeric, 2) AS receita_total
FROM vendas
GROUP BY canal_venda
ORDER BY receita_total DESC;

| canal_venda | receita_total |
| ----------- | ------------- |
| ecommerce   | 705486.21     |
| loja_fisica | 268591.07     |