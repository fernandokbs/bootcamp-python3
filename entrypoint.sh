#!/bin/sh
set -e

echo "Esperando a MySQL..."
until mysqladmin ping -h db -u root -prootpassword --silent; do
  sleep 2
done

echo "Aplicando migraciones..."
python manage.py makemigrations
python manage.py migrate

echo "Sembrando datos..."
python manage.py seed_data --carts 3

echo "Iniciando Gunicorn..."

exec gunicorn shopping_cart.wsgi:application --bind 0.0.0.0:8000