SELECT
    p.nome_produto,
    ROUND(SUM(v.quantidade * v.preco_unitario)::numeric, 2) AS receita_total
FROM vendas v
JOIN produtos p
    ON v.id_produto = p.id_produto
GROUP BY p.nome_produto
ORDER BY receita_total DESC
LIMIT 10;

| nome_produto             | receita_total |
| ------------------------ | ------------- |
| Fone de Ouvido Esportivo | 120457.54     |
| Camisa Social            | 115794.92     |
| Necessaire               | 63668.43      |
| Persiana Vertical        | 46897.53      |
| Calça Jeans Skinny       | 41313.34      |
| Condicionador Hidratante | 31587.75      |
| Shorts Jeans             | 28431.49      |
| Garrafa Térmica 1L       | 24221.94      |
| Vestido Floral           | 24132.62      |
| Notebook Inspiron 15     | 22107.07      |