FROM python:3.7-alpine

RUN mkdir /shopping_cart

WORKDIR /shopping_cart

COPY . .

COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt
