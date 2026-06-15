from ler_datalake import read_all_parquet_files
from database import (
    save_dataframe_to_postgres,
    test_connection,
    validate_table,
)


def main():
    print("Iniciando pipeline Data Lake -> PostgreSQL...\n")

    connection_ok = test_connection()

    if not connection_ok:
        print("Pipeline interrompido por erro de conexão com o banco.")
        return

    print("\nLendo arquivos Parquet do Data Lake...")

    dataframes = read_all_parquet_files()

    print("\nSalvando tabelas no PostgreSQL...")

    for table_name, df in dataframes.items():
        print(f"\nProcessando tabela: {table_name}")

        save_dataframe_to_postgres(
            df=df,
            table_name=table_name,
        )

        validate_table(table_name)

    print("\nPipeline finalizado com sucesso!")


if __name__ == "__main__":
    main()