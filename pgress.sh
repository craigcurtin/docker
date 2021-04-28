
# create a data dictory
mkdir ${HOME}/postgres-data/

# now run postgres
docker run -d --name dev-postgres -e POSTGRES_PASSWORD=Pass2020! -v ${HOME}/postgres-data/:/var/lib/postgresql/data -p 5432:5432 postgres

## 3. check that the container is running
docker ps
