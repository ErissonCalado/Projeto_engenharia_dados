SELECT
    p.nome_produto,
    p.preco_atual,
    ROUND(AVG(pc.preco_concorrente)::numeric, 2) AS preco_medio_concorrencia,
    ROUND(
        (
            ((p.preco_atual - AVG(pc.preco_concorrente))
            / NULLIF(AVG(pc.preco_concorrente), 0)) * 100
        )::numeric,
        2
    ) AS diferenca_percentual
FROM produtos p
JOIN preco_competidores pc
    ON p.id_produto = pc.id_produto
GROUP BY
    p.nome_produto,
    p.preco_atual
ORDER BY diferenca_percentual DESC;

| nome_produto              | preco_atual | preco_medio_concorrencia | diferenca_percentual |
| ------------------------- | ----------- | ------------------------ | -------------------- |
| Tênis Nike Air Max        | 68.99       | 34.49                    | 100.03               |
| Tênis Puma Future         | 123.99      | 61.99                    | 100.02               |
| Tênis Nike Dunk           | 95.9        | 47.95                    | 100.00               |
| Tênis Puma Speedcat       | 451.9       | 225.95                   | 100.00               |
| Tênis Puma Future         | 67.9        | 33.95                    | 100.00               |
| Tênis Nike Blazer         | 37.9        | 18.95                    | 100.00               |
| Tênis Nike Revolution     | 105.9       | 52.95                    | 100.00               |
| Tênis Nike Court          | 31.9        | 15.95                    | 100.00               |
| Tênis Adidas Samba        | 43.9        | 21.95                    | 100.00               |
| Tênis Nike Air Max        | 64.9        | 32.45                    | 100.00               |
| Tênis Nike Revolution     | 174.9       | 87.45                    | 100.00               |
| Tênis Adidas Stan Smith   | 197.9       | 98.95                    | 100.00               |
| Tênis Puma Suede          | 404.5       | 202.25                   | 100.00               |
| Tênis Nike Revolution     | 69.9        | 34.95                    | 100.00               |
| Tênis Adidas Stan Smith   | 38.99       | 19.50                    | 99.95                |
| Memória RAM 8GB           | 626         | 585.31                   | 6.95                 |
| Camisa Social             | 1149.9      | 1075.16                  | 6.95                 |
| Blusa de Algodão          | 52.99       | 49.55                    | 6.95                 |
| Carteira de Couro         | 66.99       | 62.97                    | 6.38                 |
| Placa Mãe B450            | 413.5       | 388.69                   | 6.38                 |
| Óculos de Natação         | 144.9       | 137.30                   | 5.54                 |
| Frigideira Antiaderente   | 41.9        | 39.80                    | 5.28                 |
| Paleta de Sombras         | 1420.99     | 1349.94                  | 5.26                 |
| Porta-moedas              | 100.5       | 95.47                    | 5.26                 |
| Suporte para Controle     | 31.99       | 30.39                    | 5.26                 |
| Assadeira de Vidro        | 100.9       | 95.86                    | 5.26                 |
| Peneira Inox              | 765.99      | 727.69                   | 5.26                 |
| Microfone para Stream     | 58.5        | 55.58                    | 5.26                 |
| Toca-discos USB           | 95.5        | 91.20                    | 4.71                 |
| Mouse Pad Gamer           | 126.99      | 121.49                   | 4.53                 |
| Fone de Ouvido Bluetooth  | 99          | 95.04                    | 4.17                 |
| Vestido Floral            | 92.9        | 89.19                    | 4.17                 |
| Edredom Casal             | 425.9       | 408.86                   | 4.17                 |
| Teclado Mecânico RGB      | 55.99       | 54.03                    | 3.63                 |
| Porta-retrato             | 84.9        | 81.93                    | 3.63                 |
| Halteres Ajustáveis       | 46          | 44.39                    | 3.63                 |
| iPhone 14                 | 616.9       | 596.34                   | 3.45                 |
| Brincos de Prata          | 48.99       | 47.36                    | 3.45                 |
| Peneira Inox              | 116.99      | 113.09                   | 3.45                 |
| Vestido Casual            | 112.9       | 109.14                   | 3.45                 |
| Suporte para Controle     | 31.9        | 30.84                    | 3.45                 |
| Jogo de Toalhas           | 109.9       | 106.24                   | 3.45                 |
| Base Líquida              | 99.9        | 96.57                    | 3.44                 |
| Jaqueta Jeans             | 93.5        | 90.39                    | 3.44                 |
| Microfone para Stream     | 140.9       | 136.67                   | 3.10                 |
| Máscara Facial            | 111.9       | 108.54                   | 3.09                 |
| Boné Esportivo            | 64.9        | 62.96                    | 3.09                 |
| Relógio de Parede         | 105.99      | 103.34                   | 2.56                 |
| Marcador de Texto         | 119.99      | 116.99                   | 2.56                 |
| Mouse Pad Gamer           | 78.9        | 76.93                    | 2.56                 |
| Porta-temperos            | 118         | 115.05                   | 2.56                 |
| Mouse Gamer Logitech      | 55.5        | 54.20                    | 2.40                 |
| Webcam 1080p              | 227.9       | 222.58                   | 2.39                 |
| Chaveiro Personalizado    | 48.99       | 47.85                    | 2.39                 |
| Fone Gamer RGB            | 175.99      | 172.03                   | 2.30                 |
| Suporte para Monitor      | 164.5       | 160.80                   | 2.30                 |
| Macacão Feminino          | 242.9       | 237.43                   | 2.30                 |
| Placa Mãe B450            | 74          | 72.34                    | 2.30                 |
| Persiana Vertical         | 404.5       | 395.40                   | 2.30                 |
| Fone de Ouvido com Fio    | 297.9       | 291.20                   | 2.30                 |
| Óculos de Natação         | 132         | 129.03                   | 2.30                 |
| Shorts Jeans              | 384.99      | 376.33                   | 2.30                 |
| Quadro Decorativo         | 93.99       | 92.11                    | 2.04                 |
| Vestido Floral            | 325.9       | 319.38                   | 2.04                 |
| Cortina Box               | 32.9        | 32.32                    | 1.79                 |
| Webcam para Stream        | 48.9        | 48.04                    | 1.78                 |
| Máscara Facial            | 107.9       | 106.01                   | 1.78                 |
| Caixa de Som Portátil     | 48          | 47.16                    | 1.78                 |
| Luminária de Mesa         | 81.99       | 80.56                    | 1.78                 |
| Headset Gamer 7.1         | 74.99       | 73.68                    | 1.78                 |
| Suporte para Controle     | 213.9       | 210.33                   | 1.70                 |
| Cardigan de Lã            | 35.9        | 35.36                    | 1.53                 |
| HD Externo 1TB            | 242.99      | 239.35                   | 1.52                 |
| Vestido Casual            | 199.9       | 196.90                   | 1.52                 |
| Post-it                   | 88.9        | 87.57                    | 1.52                 |
| Cortina Blackout          | 68.9        | 67.98                    | 1.35                 |
| Fone de Ouvido Esportivo  | 192.99      | 190.42                   | 1.35                 |
| Perfume 100ml             | 457.9       | 451.79                   | 1.35                 |
| Caixa de Som JBL          | 219.9       | 216.97                   | 1.35                 |
| Raquete de Tênis          | 64.99       | 64.12                    | 1.35                 |
| Mouse Gamer RGB           | 49          | 48.35                    | 1.35                 |
| Kit Utensílios de Cozinha | 465.5       | 459.29                   | 1.35                 |
| Faqueiro Inox 12 Peças    | 316.99      | 312.76                   | 1.35                 |
| Mochila Escolar           | 67.9        | 66.99                    | 1.35                 |
| Garrafa Esportiva         | 183.9       | 181.45                   | 1.35                 |
| Tênis de Corrida          | 147.99      | 146.02                   | 1.35                 |
| Abre-latas                | 393.9       | 388.65                   | 1.35                 |
| Edredom Casal             | 227.99      | 225.14                   | 1.27                 |
| Shampoo Anticaspa         | 315.99      | 312.04                   | 1.27                 |
| Mochila Esportiva         | 78.9        | 77.92                    | 1.26                 |
| Adaptador HDMI-VGA        | 148.9       | 147.04                   | 1.26                 |
| Batom Matte               | 34.9        | 34.55                    | 1.01                 |
| Fonte PC 500W             | 61.9        | 61.28                    | 1.01                 |
| Fonte PC 500W             | 495.9       | 490.94                   | 1.01                 |
| Cabo USB-C                | 448.5       | 444.02                   | 1.01                 |
| Teclado Gamer RGB         | 307.5       | 304.43                   | 1.01                 |
| Vestido Floral            | 243.9       | 241.46                   | 1.01                 |
| Brincos de Prata          | 935.5       | 926.15                   | 1.01                 |
| Cobertor de Lã            | 32.99       | 32.66                    | 1.01                 |
| Sérum Vitamina C          | 152         | 150.48                   | 1.01                 |