WITH vendas_produtos AS (

    SELECT
        id_produto,
        SUM(quantidade) AS total_vendido
    FROM vendas
    GROUP BY id_produto

),

menor_preco_concorrencia AS (

    SELECT
        id_produto,
        MIN(preco_concorrente) AS menor_preco
    FROM preco_competidores
    GROUP BY id_produto

)

SELECT
    p.nome_produto,
    vp.total_vendido,
    p.preco_atual,
    mpc.menor_preco,

    ROUND((
        ((p.preco_atual - mpc.menor_preco)
        / mpc.menor_preco) * 100)::numeric,
        2
    ) AS diferenca_percentual

FROM vendas_produtos vp

JOIN produtos p
    ON vp.id_produto = p.id_produto

JOIN menor_preco_concorrencia mpc
    ON vp.id_produto = mpc.id_produto

WHERE p.preco_atual > mpc.menor_preco

ORDER BY
    vp.total_vendido DESC,
    diferenca_percentual DESC;

| nome_produto              | total_vendido | preco_atual | menor_preco | diferenca_percentual |
| ------------------------- | ------------- | ----------- | ----------- | -------------------- |
| Placa Mãe B450            | 134           | 119.9       | 113.91      | 5.26                 |
| Cortina Blackout          | 130           | 68.9        | 65.45       | 5.27                 |
| Frigideira Antiaderente   | 124           | 41.9        | 39.8        | 5.28                 |
| Sabonete Facial           | 112           | 100.9       | 95.86       | 5.26                 |
| Blusa de Frio             | 110           | 89.5        | 87.71       | 2.04                 |
| Persiana Vertical         | 108           | 404.5       | 384.27      | 5.26                 |
| Cinto de Couro            | 107           | 80.99       | 76.94       | 5.26                 |
| Óculos de Sol             | 104           | 52.9        | 48.67       | 8.69                 |
| Camisa Social             | 103           | 1149.9      | 1057.91     | 8.70                 |
| Webcam para Stream        | 102           | 48.9        | 46.45       | 5.27                 |
| Cardigan de Lã            | 102           | 142.99      | 135.84      | 5.26                 |
| Smart TV 43 Polegadas     | 99            | 66.9        | 63.55       | 5.27                 |
| Notebook Inspiron 15      | 98            | 219.9       | 215.5       | 2.04                 |
| Tapete Persa              | 90            | 34.99       | 32.19       | 8.70                 |
| Calça Jeans Skinny        | 88            | 486.9       | 462.55      | 5.26                 |
| Cortina Box               | 85            | 32.9        | 31.25       | 5.28                 |
| Fone de Ouvido Esportivo  | 85            | 1428.99     | 1400.41     | 2.04                 |
| Vestido Floral            | 84            | 220         | 209         | 5.26                 |
| Shorts Jeans              | 76            | 384.99      | 365.74      | 5.26                 |
| HD Externo 2TB            | 74            | 51.99       | 50.95       | 2.04                 |
| SSD 500GB                 | 73            | 211.9       | 194.95      | 8.69                 |
| Persiana Vertical         | 73            | 44.9        | 42.65       | 5.28                 |
| Condicionador Hidratante  | 71            | 451.9       | 442.86      | 2.04                 |
| Jogo de Toalhas           | 69            | 180.9       | 171.85      | 5.27                 |
| Microfone para Stream     | 67            | 189         | 173.88      | 8.70                 |
| Microfone para Stream     | 62            | 140.9       | 133.85      | 5.27                 |
| Necessaire                | 57            | 1139.99     | 1082.99     | 5.26                 |
| Jogo de Toalhas           | 52            | 109.9       | 104.41      | 5.26                 |
| Mochila Esportiva         | 22            | 78.9        | 72.59       | 8.69                 |
| Vestido Casual            | 22            | 112.9       | 103.87      | 8.69                 |
| Tábua de Corte            | 21            | 240.99      | 228.94      | 5.26                 |
| Fone de Ouvido Esportivo  | 21            | 192.99      | 189.13      | 2.04                 |
| Edredom Casal             | 20            | 227.99      | 209.75      | 8.70                 |
| Bermuda Tactel            | 20            | 54.99       | 53.89       | 2.04                 |
| Brincos de Prata          | 19            | 48.99       | 45.07       | 8.70                 |
| Gabinete ATX              | 19            | 209.9       | 199.41      | 5.26                 |
| Colar de Ouro             | 19            | 206.9       | 202.76      | 2.04                 |
| Soundbar TV               | 19            | 88.99       | 87.21       | 2.04                 |
| Caixa de Som 2.1          | 19            | 116.99      | 114.65      | 2.04                 |
| Jaqueta Jeans             | 18            | 93.5        | 86.02       | 8.70                 |
| Mouse Pad Gamer           | 18            | 78.9        | 72.59       | 8.69                 |
| Luminária de Mesa         | 18            | 81.99       | 77.89       | 5.26                 |
| Cesto de Vime             | 17            | 194         | 178.48      | 8.70                 |
| Marcador de Texto         | 17            | 59.5        | 54.74       | 8.70                 |
| Processador de Alimentos  | 17            | 464.9       | 455.6       | 2.04                 |
| Máscara Facial            | 16            | 111.9       | 106.31      | 5.26                 |
| Toca-discos USB           | 15            | 95.5        | 87.86       | 8.70                 |
| Memória RAM 8GB           | 15            | 626         | 575.92      | 8.70                 |
| Batom Matte               | 15            | 34.9        | 33.15       | 5.28                 |
| Forma de Bolo Redonda     | 15            | 191.9       | 188.06      | 2.04                 |
| Descascador de Legumes    | 15            | 192.9       | 189.04      | 2.04                 |
| Cabo USB-C                | 14            | 448.5       | 412.62      | 8.70                 |
| Kit Utensílios de Cozinha | 14            | 465.5       | 442.22      | 5.26                 |
| Tênis de Corrida          | 14            | 147.99      | 140.59      | 5.26                 |
| Gravador de Voz           | 14            | 64.9        | 61.66       | 5.25                 |
| Mochila Esportiva         | 14            | 44.9        | 44          | 2.05                 |
| Porta-temperos            | 13            | 118         | 108.56      | 8.70                 |
| Relógio de Parede         | 13            | 105.99      | 97.51       | 8.70                 |
| Edredom Casal             | 13            | 295.9       | 272.23      | 8.69                 |
| Vestido Floral            | 13            | 92.9        | 85.47       | 8.69                 |
| Mochila Escolar           | 13            | 67.9        | 64.5        | 5.27                 |
| Notebook Inspiron 15      | 13            | 103.9       | 98.7        | 5.27                 |
| Fonte PC 500W             | 13            | 61.9        | 58.8        | 5.27                 |
| Cinto de Couro            | 13            | 102.9       | 100.84      | 2.04                 |
| Vestido Casual            | 13            | 99.5        | 97.51       | 2.04                 |
| Porta-moedas              | 13            | 226         | 221.48      | 2.04                 |
| Marcador de Texto         | 12            | 119.99      | 110.39      | 8.70                 |
| Cobertor de Lã            | 12            | 32.99       | 30.35       | 8.70                 |
| Suporte para Controle     | 12            | 213.9       | 203.2       | 5.27                 |
| Jarra de Vidro            | 12            | 395.9       | 376.1       | 5.26                 |
| Garrafa Térmica 1L        | 12            | 239.99      | 235.19      | 2.04                 |
| Tapete Persa              | 12            | 258.9       | 253.72      | 2.04                 |
| Sérum Vitamina C          | 11            | 152         | 139.84      | 8.70                 |
| Cinto de Couro            | 11            | 1108.9      | 1020.19     | 8.70                 |
| Rádio AM/FM               | 11            | 45.5        | 41.86       | 8.70                 |
| iPhone 14                 | 11            | 616.9       | 567.55      | 8.70                 |
| Vestido Floral            | 11            | 72.5        | 66.7        | 8.70                 |
| Edredom Casal             | 11            | 58.9        | 54.19       | 8.69                 |
| Persiana Vertical         | 11            | 137.9       | 131         | 5.27                 |
| Organizador de Gaveta     | 11            | 171         | 162.45      | 5.26                 |
| Base Líquida              | 11            | 99.9        | 94.91       | 5.26                 |
| Gabinete ATX              | 11            | 798.9       | 758.95      | 5.26                 |
| Edredom Casal             | 11            | 425.9       | 404.6       | 5.26                 |
| Jarra de Vidro            | 11            | 192.9       | 189.04      | 2.04                 |
| Tapete Persa              | 11            | 223.9       | 219.42      | 2.04                 |
| Vestido Floral            | 11            | 243.9       | 239.02      | 2.04                 |
| Placa Mãe B450            | 10            | 74          | 68.08       | 8.70                 |
| Óculos de Natação         | 10            | 144.9       | 133.31      | 8.69                 |
| Cardigan de Lã            | 10            | 35.9        | 34.1        | 5.28                 |
| Faqueiro Inox 12 Peças    | 10            | 39.99       | 37.99       | 5.26                 |
| Faqueiro Inox 12 Peças    | 10            | 316.99      | 301.14      | 5.26                 |
| Perfume 100ml             | 10            | 457.9       | 435         | 5.26                 |
| Mixer de Áudio            | 10            | 53.5        | 52.43       | 2.04                 |
| Amplificador de Áudio     | 10            | 73.9        | 72.42       | 2.04                 |
| Placa Mãe B450            | 9             | 413.5       | 380.42      | 8.70                 |
| Blusa de Algodão          | 9             | 52.99       | 48.75       | 8.70                 |
| Edredom Casal             | 9             | 39.9        | 37.9        | 5.28                 |
| Garrafa Esportiva         | 9             | 183.9       | 174.7       | 5.27                 |
| Fone Gamer RGB            | 9             | 175.99      | 167.19      | 5.26                 |
| Suporte para Monitor      | 9             | 164.5       | 156.28      | 5.26                 |
| SSD 500GB                 | 9             | 118.99      | 113.04      | 5.26                 |
| Controle PlayStation      | 9             | 49.99       | 47.49       | 5.26                 |
| Brincos de Prata          | 9             | 67.9        | 66.54       | 2.04                 |
| Óculos de Natação         | 9             | 58          | 56.84       | 2.04                 |
| Assadeira de Vidro        | 9             | 1310.5      | 1284.29     | 2.04                 |
| Iluminador para Stream    | 9             | 323.9       | 317.42      | 2.04                 |
| Paleta de Sombras         | 8             | 1420.99     | 1307.31     | 8.70                 |
| Chaveiro Personalizado    | 8             | 48.99       | 45.07       | 8.70                 |
| Porta-moedas              | 8             | 100.5       | 92.46       | 8.70                 |
| Processador Intel i5      | 8             | 41.9        | 39.8        | 5.28                 |
| Macacão Feminino          | 8             | 242.9       | 230.75      | 5.27                 |
| Porta-retrato             | 8             | 84.9        | 80.66       | 5.26                 |
| Caixa de Som Portátil     | 8             | 48          | 45.6        | 5.26                 |
| Creme Hidratante          | 8             | 247.9       | 242.94      | 2.04                 |
| HD Externo 1TB            | 8             | 242.99      | 238.13      | 2.04                 |
| Carteira de Couro         | 7             | 66.99       | 61.63       | 8.70                 |
| Suporte para Controle     | 7             | 31.99       | 29.43       | 8.70                 |
| Espelho de Parede         | 7             | 78.99       | 72.67       | 8.70                 |
| Webcam 1080p              | 7             | 227.9       | 216.5       | 5.27                 |
| Fone de Ouvido com Fio    | 7             | 297.9       | 283         | 5.27                 |
| Brincos de Prata          | 7             | 935.5       | 888.72      | 5.26                 |
| Caixa de Som JBL          | 7             | 219.9       | 208.91      | 5.26                 |
| Óculos de Natação         | 7             | 132         | 125.4       | 5.26                 |
| Headset Gamer 7.1         | 7             | 74.99       | 71.24       | 5.26                 |
| Edredom Casal             | 7             | 87.99       | 83.59       | 5.26                 |
| Joystick Arcade           | 7             | 116.99      | 111.14      | 5.26                 |
| Toca-discos USB           | 7             | 371.9       | 364.46      | 2.04                 |
| Peneira Inox              | 6             | 116.99      | 107.63      | 8.70                 |
| Assadeira de Vidro        | 6             | 100.9       | 92.83       | 8.69                 |
| Máscara Facial            | 6             | 107.9       | 99.27       | 8.69                 |
| Kit Gamer Completo        | 6             | 109.9       | 101.11      | 8.69                 |
| Suporte para Monitor      | 6             | 430         | 408.5       | 5.26                 |
| Fone de Ouvido Bluetooth  | 6             | 99          | 94.05       | 5.26                 |
| Halteres Ajustáveis       | 6             | 46          | 43.7        | 5.26                 |
| Abre-latas                | 6             | 393.9       | 374.2       | 5.26                 |
| Peneira Inox              | 6             | 765.99      | 727.69      | 5.26                 |
| Carteira de Couro         | 6             | 1287.99     | 1262.23     | 2.04                 |
| Vestido Floral            | 6             | 325.9       | 319.38      | 2.04                 |
| Tela Mosquiteira          | 6             | 151         | 147.98      | 2.04                 |
| Teclado Mecânico RGB      | 5             | 223.99      | 206.07      | 8.70                 |
| Teclado Gamer RGB         | 5             | 307.5       | 282.9       | 8.70                 |
| Colchonete Yoga           | 5             | 140.9       | 133.85      | 5.27                 |
| Porta-retrato             | 5             | 74.99       | 71.24       | 5.26                 |
| Placa Mãe B450            | 5             | 180.9       | 177.28      | 2.04                 |
| Adaptador HDMI-VGA        | 5             | 299.9       | 293.9       | 2.04                 |
| Pesos de Pulso            | 5             | 1324.9      | 1298.4      | 2.04                 |
| Meia Esportiva            | 5             | 391.9       | 384.06      | 2.04                 |
| Shampoo Anticaspa         | 4             | 315.99      | 290.71      | 8.70                 |
| Adaptador HDMI-VGA        | 4             | 148.9       | 136.99      | 8.69                 |
| Gabinete ATX              | 4             | 171.99      | 163.39      | 5.26                 |
| Blusa de Algodão          | 4             | 36.9        | 36.16       | 2.05                 |
| Raquete de Tênis          | 4             | 64.99       | 63.69       | 2.04                 |
| Microfone para Stream     | 3             | 58.5        | 53.82       | 8.70                 |
| Fonte PC 500W             | 3             | 495.9       | 456.23      | 8.70                 |
| Sabonete Facial           | 3             | 149.9       | 137.91      | 8.69                 |
| Caixa de Som 2.1          | 3             | 107.9       | 105.74      | 2.04                 |
| Mesa para Notebook        | 3             | 519.5       | 509.11      | 2.04                 |
| Carteira de Couro         | 2             | 273.9       | 251.99      | 8.69                 |
| Marcador de Texto         | 2             | 203.9       | 193.7       | 5.27                 |
| Teclado Mecânico RGB      | 2             | 55.99       | 53.19       | 5.26                 |
| Mixer de Áudio            | 1             | 107.99      | 99.35       | 8.70                 |