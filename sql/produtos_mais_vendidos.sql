SELECT
    p.id_produto,
    p.nome_produto,
    SUM(v.quantidade) AS total_vendido
FROM vendas v
JOIN produtos p
    ON v.id_produto = p.id_produto
GROUP BY
    p.id_produto,
    p.nome_produto
ORDER BY total_vendido DESC
LIMIT 10;

| id_produto       | nome_produto            | total_vendido |
| ---------------- | ----------------------- | ------------- |
| prd_bf5d8671f7a9 | Placa Mãe B450          | 134           |
| prd_2293732b7542 | Cortina Blackout        | 130           |
| prd_4ee65ed59110 | Frigideira Antiaderente | 124           |
| prd_2cbafff50c72 | Sabonete Facial         | 112           |
| prd_686e2aab873d | Blusa de Frio           | 110           |
| prd_334f4a32f979 | Persiana Vertical       | 108           |
| prd_30518d908a92 | Cinto de Couro          | 107           |
| prd_a4025bac91a7 | Óculos de Sol           | 104           |
| prd_d22d1b8b1502 | Camisa Social           | 103           |
| prd_045813f96891 | Cardigan de Lã          | 102           |