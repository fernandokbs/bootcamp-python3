#!/bin/sh
set -e

echo "Aplicando migraciones..."
python manage.py makemigrations
python manage.py migrate

echo "Sembrando datos..."
python manage.py seed_data --carts 3

echo "Iniciando Gunicorn..."

exec gunicorn shopping_cart.wsgi:application --bind 0.0.0.0:8000