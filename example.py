#! /usr/local/bin/python
import sys
from coinbase.wallet.client import Client

API_KEY = sys.argv[1]
API_SECRECT = sys.argv[2] 

print "This is API_KEY:",API_KEY," and this is API_SECRECT:", API_SECRECT 
