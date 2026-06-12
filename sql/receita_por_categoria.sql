SELECT
    p.categoria,
    ROUND(SUM(v.quantidade * v.preco_unitario)::numeric, 2) AS receita_total
FROM vendas v
JOIN produtos p
    ON v.id_produto = p.id_produto
GROUP BY p.categoria
ORDER BY receita_total DESC;

| categoria   | receita_total |
| ----------- | ------------- |
| Moda        | 248124.15     |
| Áudio       | 137061.47     |
| Acessórios  | 120909.94     |
| Casa        | 112704.52     |
| Cozinha     | 85059.89      |
| Beleza      | 66852.52      |
| Eletrônicos | 62826.28      |
| Informática | 61410.87      |
| Games       | 50176.04      |
| Esporte     | 24711.59      |