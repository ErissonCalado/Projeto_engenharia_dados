WITH receita_clientes AS (
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
)

SELECT
    *,
    CASE
        WHEN receita_total >= 5000 THEN 'VIP'
        WHEN receita_total >= 2000 THEN 'TOP_TIER'
        ELSE 'REGULAR'
    END AS segmento
FROM receita_clientes
ORDER BY receita_total DESC;

| id_cliente       | nome_cliente           | receita_total | segmento |
| ---------------- | ---------------------- | ------------- | -------- |
| cus_2b1b3e2a1515 | Ana Sophia Pereira     | 30716.63      | VIP      |
| cus_25d1cb23f872 | Melissa Pastor         | 30211.93      | VIP      |
| cus_c3944101594c | Murilo da Mata         | 28285.82      | VIP      |
| cus_fa3a88d1ccef | Dr. Benício Gomes      | 27424.23      | VIP      |
| cus_f64907d41a69 | Henrique da Conceição  | 26687.99      | VIP      |
| cus_b0026583b709 | Dra. Mariane Pacheco   | 25454.83      | VIP      |
| cus_4e62d52db97a | Josué Souza            | 24750.17      | VIP      |
| cus_c9cd13d1ae9f | Srta. Yasmin Siqueira  | 23674.1       | VIP      |
| cus_3580317ddeab | Bella Borges           | 22865.99      | VIP      |
| cus_0343c0763f76 | Vitor Gabriel da Luz   | 22734.53      | VIP      |
| cus_71308b76151a | Srta. Amanda Sousa     | 21960.13      | VIP      |
| cus_cf84750c1fb4 | Alana Teixeira         | 21609.35      | VIP      |
| cus_96658dc10aa5 | Agatha Silveira        | 21445.08      | VIP      |
| cus_66677d443e5e | Cecília da Luz         | 21335.05      | VIP      |
| cus_f50da5532735 | João Gabriel Porto     | 21238.95      | VIP      |
| cus_7262f4e5ce9f | Sophia Monteiro        | 21205.9       | VIP      |
| cus_31874cf2d1e5 | Nina Moura             | 21109.53      | VIP      |
| cus_25c656241a9a | Amanda Novais          | 21009.39      | VIP      |
| cus_d4db3db9eccb | Ana Julia Camargo      | 20861.16      | VIP      |
| cus_eae005fd3470 | Calebe Fogaça          | 20596.14      | VIP      |
| cus_13af118ef4e8 | Sra. Sarah Teixeira    | 20065.6       | VIP      |
| cus_9d2dd4770a79 | Luigi Camargo          | 20052.82      | VIP      |
| cus_ec8d75866856 | Sr. Luan Vargas        | 19671.39      | VIP      |
| cus_78ab1cf16e12 | Beatriz Garcia         | 19530.47      | VIP      |
| cus_f1a06ae11717 | Gustavo Henrique Rios  | 19185.31      | VIP      |
| cus_b42a15933072 | Dr. Heitor Rezende     | 19024.24      | VIP      |
| cus_508a15ccf0fa | Sra. Zoe Campos        | 19000.14      | VIP      |
| cus_6ff11137142d | Sr. Vitor Gabriel Sá   | 18722.52      | VIP      |
| cus_a01814ad9247 | Ana Beatriz Alves      | 18583.2       | VIP      |
| cus_0ff4cceccc6f | João Aparecida         | 18436.2       | VIP      |
| cus_8fa04d3a5837 | Rafael Porto           | 18321.18      | VIP      |
| cus_8ad3c8745efb | Eduardo Cunha          | 18286.8       | VIP      |
| cus_c8d383cfde0c | Maria Cecília Oliveira | 17357.77      | VIP      |
| cus_79d52b75f259 | Elisa Freitas          | 17289.51      | VIP      |
| cus_1a38731e1fbe | Otávio Fernandes       | 17163.3       | VIP      |
| cus_a8f8e01eaee8 | Elisa Martins          | 16924.67      | VIP      |
| cus_a9747473c5c6 | Ana Lívia Aparecida    | 16915.97      | VIP      |
| cus_f1eccf8e0d99 | Luiz Miguel Câmara     | 16836.38      | VIP      |
| cus_d36c11b261a6 | Cauã Rocha             | 16563.85      | VIP      |
| cus_418af67b6b28 | Miguel Ramos           | 16550.54      | VIP      |
| cus_d2762f5968fe | Dra. Aurora Pastor     | 15435.67      | VIP      |
| cus_4209c24e0be2 | Maya Castro            | 15186.43      | VIP      |
| cus_911b23c97589 | Heitor Nunes           | 15121.01      | VIP      |
| cus_639110db69ed | Sr. João Vitor Barros  | 14425.28      | VIP      |
| cus_a2e18141f826 | Ísis Leão              | 13407.52      | VIP      |
| cus_644bf6820c61 | Heloísa Andrade        | 13316.83      | VIP      |
| cus_36595eecf105 | Bruno Novaes           | 13169.93      | VIP      |
| cus_0914bdf6e1fe | Isabelly Câmara        | 12976.16      | VIP      |
| cus_884be6e0ce9a | Emanuel Vieira         | 11714.4       | VIP      |
| cus_df9e0b31fa20 | Yuri Albuquerque       | 9665.29       | VIP      |