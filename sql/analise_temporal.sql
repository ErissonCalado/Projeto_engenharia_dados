SELECT
    EXTRACT(DOW FROM data_venda) AS dia_semana,
    SUM(quantidade * preco_unitario) AS receita
FROM vendas
GROUP BY dia_semana
ORDER BY dia_semana;

| dia_semana | receita   |
| ---------- | --------- |
| 0          | 160225.98 |
| 1          | 135781.2  |
| 2          | 128129.19 |
| 3          | 139014.42 |
| 4          | 136847.16 |
| 5          | 110699.77 |
| 6          | 163379.56 |