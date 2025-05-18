FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    default-mysql-client \
    default-libmysqlclient-dev \
    gcc \
    musl-dev \
    libffi-dev \
    pkg-config \
 && rm -rf /var/lib/apt/lists/*

COPY . .

WORKDIR /shopping_cart

COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/app/entrypoint.sh"]