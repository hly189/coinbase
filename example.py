#! /usr/local/bin/python

from coinbase.wallet.client import Client

api_key = 'IeiDytms6KdJ2joh'
api_secrect = 'Zi9V990bQzm7wZrgSiUbhcHEmQ3YptMJ'
base_url = 'https://api.coinbase.com/v2/'

client = Client(api_key, api_secrect)

user = client.get_current_user()

