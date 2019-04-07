# 6_DBI_8apr_StorageII_Activity


PostgreSQL:

    docker run -dit postgres:latest
    docker exec -it ID_POSTGRES psql -U postgres

Pandas:

    docker build . -t NAME_PANDAS
    docker cp script.py ID_PANDAS:. && docker exec -it ID_PANDAS python script.py
