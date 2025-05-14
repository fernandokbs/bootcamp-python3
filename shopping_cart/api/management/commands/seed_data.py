import random
from django.core.management.base import BaseCommand
from api.models import Cart, Product

class Command(BaseCommand):
    help = 'Seed data: carts and products'

    def add_arguments(self, parser):
        parser.add_argument(
            '--carts',
            type=int,
            default=5,
            help='Número de carritos a crear (por defecto 5)',
        )

    def handle(self, *args, **options):
        cart_count = options['carts']

        for i in range(1, 11):
            name = f'Producto {i}'
            price = round(random.uniform(10.0, 100.0), 2)
            product = Product.objects.create(name=name, price=price)
            self.stdout.write(self.style.SUCCESS(f'📦 Producto creado: {product.name} - ${product.price}'))

        for _ in range(cart_count):
            cart = Cart.objects.create()
            self.stdout.write(self.style.SUCCESS(f'🛒 Cart creado con ID {cart.id}'))
