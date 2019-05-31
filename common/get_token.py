#!/usr/bin/env python
import os

import hvac

client = hvac.Client()
client = hvac.Client(url=os.environ["VAULT_ADDR"])
response = client.auth_approle(
    os.environ["VAULT_ROLE_ID"], os.environ["VAULT_SECRET_ID"]
)
client.token = response["auth"]["client_token"]
assert client.is_authenticated()
print(response["auth"]["client_token"])
