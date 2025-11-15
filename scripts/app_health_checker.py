#!/usr/bin/env python3


import requests

URL = "https://wisecow.local"

try:
    response = requests.get(URL, verify=False, timeout=5)
    if response.status_code == 200:
        print("✅ Application is UP and responding correctly!")
    else:
        print(f"⚠️  Application returned status {response.status_code}")
except requests.exceptions.RequestException as e:
    print(f"❌ Application seems DOWN: {e}")
