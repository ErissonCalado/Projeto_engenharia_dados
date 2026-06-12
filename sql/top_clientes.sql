SELECT
    c.id_cliente,
    c.nome_cliente,
    SUM(v.quantidade * v.preco_unitario) AS receita_total
FROM vendas v
JOIN clientes c
    ON v.id_cliente = c.id_cliente
GROUP BY
    c.id_cliente,
    c.nome_cliente
ORDER BY receita_total DESC
LIMIT 10;

| id_cliente       | nome_cliente          | receita_total |
| ---------------- | --------------------- | ------------- |
| cus_2b1b3e2a1515 | Ana Sophia Pereira    | 30716.63      |
| cus_25d1cb23f872 | Melissa Pastor        | 30211.93      |
| cus_c3944101594c | Murilo da Mata        | 28285.82      |
| cus_fa3a88d1ccef | Dr. Benício Gomes     | 27424.23      |
| cus_f64907d41a69 | Henrique da Conceição | 26687.99      |
| cus_b0026583b709 | Dra. Mariane Pacheco  | 25454.83      |
| cus_4e62d52db97a | Josué Souza           | 24750.17      |
| cus_c9cd13d1ae9f | Srta. Yasmin Siqueira | 23674.1       |
| cus_3580317ddeab | Bella Borges          | 22865.99      |
| cus_0343c0763f76 | Vitor Gabriel da Luz  | 22734.53      |