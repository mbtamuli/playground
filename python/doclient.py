import json
import os
import urllib.request

params = json.dumps({
                "name": "example",
                "region": "blr1",
                "size": "s-1vcpu-1gb",
                "image": "ubuntu-18-04-x64",
        }).encode('utf-8')
token = os.environ['DO_TOKEN']

# Create a droplet
req = urllib.request.Request("https://api.digitalocean.com/v2/droplets")
req.add_header('Content-Type', 'application/json')
req.add_header('Authorization', 'Bearer ' + token)
with urllib.request.urlopen(req, jparams) as f:
    print(f.read().decode('utf-8'))

# Delete a droplet
# req = urllib.request.Request("https://api.digitalocean.com/v2/droplets/126039070")
# req.add_header('Content-Type', 'application/json')
# req.add_header('Authorization', 'Bearer ' + token)
# req.method='DELETE'
# with urllib.request.urlopen(req) as f:
#     print(f.read().decode('utf-8'))
