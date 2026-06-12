WITH ranking_precos AS (

    SELECT
        p.nome_produto,
        pc.nome_concorrente,
        pc.preco_concorrente,

        ROW_NUMBER() OVER(
            PARTITION BY p.id_produto
            ORDER BY pc.preco_concorrente
        ) AS ranking

    FROM preco_competidores pc

    JOIN produtos p
        ON pc.id_produto = p.id_produto

)

SELECT *
FROM ranking_precos
WHERE ranking = 1;

| nome_produto              | nome_concorrente | preco_concorrente | ranking |
| ------------------------- | ---------------- | ----------------- | ------- |
| Espelho de Parede         | Magalu           | 167.48            | 1       |
| HD Externo 1TB            | Mercado Livre    | 238.13            | 1       |
| Controle Xbox             | Amazon           | 219.9             | 1       |
| Memória RAM 8GB           | Shopee           | 575.92            | 1       |
| Cardigan de Lã            | Amazon           | 135.84            | 1       |
| Carteira de Couro         | Shopee           | 61.63             | 1       |
| Assadeira de Vidro        | Amazon           | 92.83             | 1       |
| Faqueiro Inox 12 Peças    | Magalu           | 301.14            | 1       |
| Relógio de Parede         | Magalu           | 97.51             | 1       |
| Persiana Vertical         | Magalu           | 131               | 1       |
| Vestido Floral            | Amazon           | 66.7              | 1       |
| Mixer de Áudio            | Shopee           | 99.35             | 1       |
| Vestido Floral            | Magalu           | 239.02            | 1       |
| Edredom Casal             | Mercado Livre    | 272.23            | 1       |
| Post-it                   | Mercado Livre    | 81.79             | 1       |
| Edredom Casal             | Magalu           | 404.6             | 1       |
| Porta-retrato             | Amazon           | 71.24             | 1       |
| Caixa de Som Portátil     | Shopee           | 45.6              | 1       |
| Tênis Puma Speedcat       | Amazon           | 225.95            | 1       |
| Vestido Casual            | Shopee           | 97.51             | 1       |
| Fone de Ouvido Bluetooth  | Amazon           | 94.05             | 1       |
| Tênis Nike Blazer         | Magalu           | 18.95             | 1       |
| Gabinete ATX              | Shopee           | 758.95            | 1       |
| Suporte para Monitor      | Amazon           | 156.28            | 1       |
| Shampoo Anticaspa         | Magalu           | 290.71            | 1       |
| Máscara Facial            | Magalu           | 106.31            | 1       |
| Fonte PC 500W             | Magalu           | 58.8              | 1       |
| Tapete Persa              | Amazon           | 32.19             | 1       |
| Joystick Arcade           | Amazon           | 111.14            | 1       |
| Luminária de Mesa         | Shopee           | 77.89             | 1       |
| Marcador de Texto         | Magalu           | 110.39            | 1       |
| Tênis Puma Suede          | Amazon           | 202.25            | 1       |
| Cortina Blackout          | Mercado Livre    | 65.45             | 1       |
| Notebook Inspiron 15      | Mercado Livre    | 98.7              | 1       |
| Tela Mosquiteira          | Mercado Livre    | 147.98            | 1       |
| Jogo de Toalhas           | Shopee           | 104.41            | 1       |
| Porta-moedas              | Mercado Livre    | 92.46             | 1       |
| Porta-moedas              | Shopee           | 221.48            | 1       |
| Controle Xbox             | Amazon           | 329.55            | 1       |
| Bicicleta Ergométrica     | Mercado Livre    | 228.99            | 1       |
| Mouse Gamer RGB           | Magalu           | 49.99             | 1       |
| Sabonete Facial           | Mercado Livre    | 95.86             | 1       |
| Vestido Casual            | Amazon           | 189.91            | 1       |
| Cinto de Couro            | Shopee           | 76.94             | 1       |
| Cabo USB-C                | Shopee           | 412.62            | 1       |
| Brincos de Prata          | Shopee           | 888.72            | 1       |
| Saia Midi                 | Magalu           | 77.27             | 1       |
| Cobertor de Lã            | Amazon           | 30.35             | 1       |
| Persiana Vertical         | Magalu           | 384.27            | 1       |
| SSD 500GB                 | Mercado Livre    | 113.04            | 1       |
| Teclado Mecânico RGB      | Mercado Livre    | 53.19             | 1       |
| Adaptador HDMI-VGA        | Mercado Livre    | 136.99            | 1       |
| Porta-retrato             | Mercado Livre    | 151.47            | 1       |
| Notebook Inspiron 15      | Amazon           | 215.5             | 1       |
| Microfone para Stream     | Amazon           | 133.85            | 1       |
| Tênis Nike Revolution     | Magalu           | 34.95             | 1       |
| Rádio AM/FM               | Shopee           | 41.86             | 1       |
| Suporte para Controle     | Amazon           | 29.35             | 1       |
| Halteres Ajustáveis       | Magalu           | 52.99             | 1       |
| Mochila Escolar           | Amazon           | 64.5              | 1       |
| Gabinete ATX              | Mercado Livre    | 199.41            | 1       |
| Óculos de Sol             | Magalu           | 164.99            | 1       |
| Fonte PC 500W             | Mercado Livre    | 456.23            | 1       |
| Assadeira de Vidro        | Mercado Livre    | 1284.29           | 1       |
| Tênis Nike Air Max        | Amazon           | 34.49             | 1       |
| Tênis Nike Revolution     | Shopee           | 52.95             | 1       |
| Kit Gamer Completo        | Amazon           | 101.11            | 1       |
| Brincos de Prata          | Mercado Livre    | 66.54             | 1       |
| Soundbar TV               | Magalu           | 87.21             | 1       |
| Mouse Pad Gamer           | Shopee           | 72.59             | 1       |
| Mochila Esportiva         | Amazon           | 44                | 1       |
| Frigideira Antiaderente   | Shopee           | 39.8              | 1       |
| Placa Mãe B450            | Magalu           | 380.42            | 1       |
| Kit Gamer Completo        | Shopee           | 88.9              | 1       |
| Raquete de Tênis          | Shopee           | 66.41             | 1       |
| Rádio AM/FM               | Amazon           | 331.23            | 1       |
| Webcam 1080p              | Amazon           | 216.5             | 1       |
| Garrafa Esportiva         | Mercado Livre    | 174.7             | 1       |
| Tapete Persa              | Magalu           | 219.42            | 1       |
| Jarra de Vidro            | Magalu           | 189.04            | 1       |
| Vestido Casual            | Mercado Livre    | 103.87            | 1       |
| Microfone para Stream     | Shopee           | 53.82             | 1       |
| Mouse Gamer RGB           | Mercado Livre    | 48.02             | 1       |
| Caixa de Som 2.1          | Magalu           | 105.74            | 1       |
| Óculos de Natação         | Amazon           | 133.31            | 1       |
| Iluminador para Stream    | Shopee           | 317.42            | 1       |
| Sérum Vitamina C          | Amazon           | 139.84            | 1       |
| Tapete Persa              | Amazon           | 253.72            | 1       |
| Adaptador HDMI-VGA        | Shopee           | 293.9             | 1       |
| Calça Jeans Skinny        | Magalu           | 462.55            | 1       |
| Processador de Alimentos  | Mercado Livre    | 455.6             | 1       |
| Base Líquida              | Mercado Livre    | 94.91             | 1       |
| Porta-temperos            | Shopee           | 41.99             | 1       |
| Mouse Gamer Logitech      | Amazon           | 52.72             | 1       |
| Blusa de Frio             | Shopee           | 87.71             | 1       |
| Gabinete ATX              | Mercado Livre    | 92.9              | 1       |
| Placa Mãe B450            | Magalu           | 68.08             | 1       |
| Peneira Inox              | Shopee           | 727.69            | 1       |
| Necessaire                | Amazon           | 1082.99           | 1       |
| Edredom Casal             | Mercado Livre    | 209.75            | 1       |
| Faqueiro Inox 12 Peças    | Magalu           | 37.99             | 1       |
| Bicicleta Ergométrica     | Shopee           | 63.9              | 1       |
| Suporte para Monitor      | Amazon           | 408.5             | 1       |
| Óculos de Natação         | Shopee           | 56.84             | 1       |
| Kit Utensílios de Cozinha | Amazon           | 442.22            | 1       |
| Mesa para Notebook        | Mercado Livre    | 509.11            | 1       |
| Controle PlayStation      | Mercado Livre    | 47.49             | 1       |
| Fone de Ouvido com Fio    | Shopee           | 283               | 1       |
| Porta-temperos            | Amazon           | 108.56            | 1       |
| Conjunto de Malha         | Mercado Livre    | 89.09             | 1       |
| Persiana Vertical         | Magalu           | 42.65             | 1       |
| Cortina Box               | Mercado Livre    | 31.25             | 1       |
| Óculos de Natação         | Mercado Livre    | 125.4             | 1       |
| Abre-latas                | Amazon           | 374.2             | 1       |
| Boné Esportivo            | Mercado Livre    | 59.71             | 1       |
| Mixer de Áudio            | Shopee           | 52.43             | 1       |
| Travesseiro Ortopédico    | Mercado Livre    | 179.99            | 1       |
| Garrafa Térmica 1L        | Amazon           | 324.99            | 1       |
| Roteador Wi-Fi 6          | Shopee           | 39.9              | 1       |
| Espelho de Parede         | Shopee           | 72.67             | 1       |
| Mouse Pad Gamer           | Shopee           | 116.83            | 1       |
| HD Externo 2TB            | Mercado Livre    | 50.95             | 1       |
| Tábua de Corte            | Shopee           | 228.94            | 1       |
| Jogo de Toalhas           | Magalu           | 171.85            | 1       |
| Vestido Floral            | Shopee           | 319.38            | 1       |
| Peneira Inox              | Amazon           | 107.63            | 1       |
| Chaveiro Personalizado    | Shopee           | 45.07             | 1       |
| Edredom Casal             | Magalu           | 54.19             | 1       |
| Elástico de Resistência   | Amazon           | 123.9             | 1       |
| Relógio Analógico         | Shopee           | 111.83            | 1       |
| Jarra de Vidro            | Amazon           | 376.1             | 1       |
| Jaqueta Jeans             | Amazon           | 86.02             | 1       |
| Carteira de Couro         | Mercado Livre    | 1262.23           | 1       |
| Casaco de Inverno         | Amazon           | 35.9              | 1       |
| Pesos de Pulso            | Magalu           | 1298.4            | 1       |
| Forma de Bolo Redonda     | Magalu           | 188.06            | 1       |
| Marcador de Texto         | Magalu           | 54.74             | 1       |
| Gravador de Voz           | Mercado Livre    | 61.66             | 1       |
| Pesos de Pulso            | Shopee           | 83.99             | 1       |
| Óculos de Sol             | Magalu           | 48.67             | 1       |
| Edredom Casal             | Amazon           | 83.59             | 1       |
| Suporte para Controle     | Shopee           | 203.2             | 1       |
| Gabinete ATX              | Amazon           | 163.39            | 1       |
| Suporte para Controle     | Mercado Livre    | 29.43             | 1       |
| Sabonete Facial           | Amazon           | 137.91            | 1       |
| Cinto de Couro            | Mercado Livre    | 1020.19           | 1       |
| Condicionador Hidratante  | Magalu           | 442.86            | 1       |
| Marcador de Texto         | Shopee           | 193.7             | 1       |
| Garrafa Térmica 1L        | Mercado Livre    | 235.19            | 1       |
| Blusa de Algodão          | Shopee           | 48.75             | 1       |
| Amplificador de Áudio     | Shopee           | 72.42             | 1       |
| Cardigan de Lã            | Mercado Livre    | 34.1              | 1       |
| Vestido Floral            | Mercado Livre    | 209               | 1       |
| Perfume 100ml             | Amazon           | 435               | 1       |
| Assadeira de Vidro        | Magalu           | 35.27             | 1       |
| Placa Mãe B450            | Mercado Livre    | 113.91            | 1       |
| Mochila Esportiva         | Magalu           | 72.59             | 1       |
| Quadro Decorativo         | Mercado Livre    | 92.11             | 1       |
| Descascador de Legumes    | Shopee           | 189.04            | 1       |
| Colar de Ouro             | Shopee           | 202.76            | 1       |
| Tênis Nike Dunk           | Magalu           | 47.95             | 1       |
| Teclado Mecânico RGB      | Shopee           | 206.07            | 1       |
| Webcam para Stream        | Shopee           | 46.45             | 1       |
| Tênis Nike Air Max        | Magalu           | 32.45             | 1       |
| Halteres Ajustáveis       | Mercado Livre    | 43.7              | 1       |
| Tênis de Corrida          | Shopee           | 140.59            | 1       |
| Toca-discos USB           | Shopee           | 87.86             | 1       |
| Processador Intel i5      | Amazon           | 39.8              | 1       |
| iPhone 14                 | Magalu           | 567.55            | 1       |
| Batom Matte               | Amazon           | 33.15             | 1       |
| Tênis Nike Revolution     | Shopee           | 87.45             | 1       |
| Raquete de Tênis          | Amazon           | 63.69             | 1       |
| Teclado Gamer RGB         | Amazon           | 282.9             | 1       |
| Camisa Social             | Magalu           | 1057.91           | 1       |
| Shorts Jeans              | Mercado Livre    | 365.74            | 1       |
| Boné Esportivo            | Magalu           | 60.67             | 1       |
| Tênis Adidas Stan Smith   | Shopee           | 98.95             | 1       |
| Toca-discos USB           | Magalu           | 364.46            | 1       |
| Smart TV 43 Polegadas     | Amazon           | 63.55             | 1       |
| Tênis Nike Court          | Magalu           | 15.95             | 1       |
| Paleta de Sombras         | Shopee           | 1307.31           | 1       |
| Porta-retrato             | Magalu           | 80.66             | 1       |
| Fone de Ouvido Esportivo  | Shopee           | 189.13            | 1       |
| Microfone para Stream     | Amazon           | 173.88            | 1       |
| Meia Esportiva            | Magalu           | 384.06            | 1       |
| SSD 500GB                 | Amazon           | 71.9              | 1       |
| Caixa de Som 2.1          | Mercado Livre    | 114.65            | 1       |
| Máscara Facial            | Mercado Livre    | 99.27             | 1       |
| Cesto de Vime             | Shopee           | 178.48            | 1       |
| Blusa de Algodão          | Amazon           | 36.16             | 1       |
| Gravador de Voz           | Magalu           | 156.99            | 1       |
| Fone Gamer RGB            | Shopee           | 167.19            | 1       |
| Edredom Casal             | Mercado Livre    | 37.9              | 1       |
| Organizador de Gaveta     | Magalu           | 162.45            | 1       |
| Brincos de Prata          | Shopee           | 45.07             | 1       |
| Creme Hidratante          | Magalu           | 242.94            | 1       |
| Fone de Ouvido Esportivo  | Shopee           | 1400.41           | 1       |
| Bermuda Tactel            | Mercado Livre    | 53.89             | 1       |
| Tênis Adidas Samba        | Amazon           | 21.95             | 1       |
| Fone Gamer Wireless       | Amazon           | 89.29             | 1       |
| Tênis Puma Future         | Magalu           | 33.95             | 1       |
| Carteira de Couro         | Mercado Livre    | 251.99            | 1       |
| Edredom Casal             | Magalu           | 95.9              | 1       |
| Caixa de Som JBL          | Shopee           | 208.91            | 1       |
| Macacão Feminino          | Magalu           | 230.75            | 1       |
| Placa Mãe B450            | Magalu           | 177.28            | 1       |
| Tênis Adidas Stan Smith   | Amazon           | 19.5              | 1       |
| Cinto de Couro            | Magalu           | 100.84            | 1       |
| Vestido Floral            | Magalu           | 85.47             | 1       |
| Tênis Puma Future         | Shopee           | 61.99             | 1       |
| Headset Gamer 7.1         | Magalu           | 71.24             | 1       |
| Colchonete Yoga           | Shopee           | 133.85            | 1       |
| Cinto de Couro            | Shopee           | 573.29            | 1       |
| SSD 500GB                 | Shopee           | 194.95            | 1       |
| Regata Básica             | Amazon           | 213.99            | 1       |