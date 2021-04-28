


# motivation from this https://markheath.net/post/exploring-postgresql-with-docker







docker run psql psql --version:wq


docker run -d -p 5432:5432 -v postgres-data:/var/lib/postgresql/data  --name postgres1 postgres

