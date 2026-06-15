import io

import boto3
import pandas as pd

from config import (
    AWS_ACCESS_KEY_ID,
    AWS_REGION,
    AWS_SECRET_ACCESS_KEY,
    BUCKET_NAME,
    S3_ENDPOINT_URL,
)


PARQUET_FILES = [
    "clientes.parquet",
    "produtos.parquet",
    "vendas.parquet",
    "preco_competidores.parquet",
]


s3 = boto3.client(
    "s3",
    region_name=AWS_REGION,
    endpoint_url=S3_ENDPOINT_URL,
    aws_access_key_id=AWS_ACCESS_KEY_ID,
    aws_secret_access_key=AWS_SECRET_ACCESS_KEY,
)


print("Arquivos no bucket:")

response = s3.list_objects_v2(Bucket=BUCKET_NAME)

for obj in response.get("Contents", []):
    print(f"- {obj['Key']}")


dataframes = {}

print("\nLendo arquivos Parquet:")

for file_key in PARQUET_FILES:
    response = s3.get_object(
        Bucket=BUCKET_NAME,
        Key=file_key,
    )

    df = pd.read_parquet(
        io.BytesIO(response["Body"].read())
    )

    table_name = file_key.replace(".parquet", "")
    dataframes[table_name] = df

    print(f"\nArquivo: {file_key}")
    print(f"Linhas e colunas: {df.shape}")
    print(df.head())

def read_all_parquet_files():
    dataframes = {}

    for file_key in PARQUET_FILES:
        response = s3.get_object(
            Bucket=BUCKET_NAME,
            Key=file_key,
        )

        df = pd.read_parquet(
            io.BytesIO(response["Body"].read())
        )

        table_name = file_key.replace(".parquet", "")
        dataframes[table_name] = df

    return dataframes