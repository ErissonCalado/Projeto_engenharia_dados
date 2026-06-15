import pandas as pd
from sqlalchemy import create_engine, text

from config import DATABASE_URL


if not DATABASE_URL:
    raise ValueError("DATABASE_URL não encontrada no .env")


db_engine = create_engine(DATABASE_URL)


def test_connection():
    try:
        with db_engine.connect() as conn:
            conn.execute(text("SELECT 1"))
            print("Conexão com o banco de dados bem-sucedida!")
            return True

    except Exception as e:
        print(f"Erro ao conectar ao banco de dados: {e}")
        return False


def save_dataframe_to_postgres(df, table_name):
    df.to_sql(
        name=table_name,
        con=db_engine,
        if_exists="replace",
        index=False,
    )

    print(f"Tabela '{table_name}' salva com sucesso.")


def validate_table(table_name):
    query = text(f"SELECT COUNT(*) AS total_linhas FROM {table_name}")

    df_result = pd.read_sql_query(query, db_engine)

    total_linhas = df_result.loc[0, "total_linhas"]

    print(f"Tabela '{table_name}': {total_linhas} linhas.")


if __name__ == "__main__":
    test_connection()