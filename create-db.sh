docker run -d \
  --name my_postgres \
  -e POSTGRES_USER=sa \
  -e POSTGRES_PASSWORD=sa \
  -e POSTGRES_DB=quirk \
  -p 5432:5432 \
  postgres:18
