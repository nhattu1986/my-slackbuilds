#!/usr/bin/python3
import sys
import requests

# Slackware snap-find command :D
# Run python3 snap-find.py <package>
# First line is what you need:
# {'aliases': None, 'anon_download_url': 'https://api.snapcraft.io/api/v1/snaps/download/QRDEfjn4WJYnm0FzDKwqqRZZI77awQEV_348.snap', 'apps':
# If you see "Error: 404" means package has different name. 
# και τώρα ξέρεις ;) 

if len(sys.argv) != 2:
    print("Usage: python snap-find.py <package>")
    sys.exit(1)

snap_name = sys.argv[1]

url = f"https://api.snapcraft.io/api/v1/snaps/details/{snap_name}"

# hm...
headers = {
    "X-Ubuntu-Series": "16"  
}

response = requests.get(url, headers=headers)


if response.status_code == 200:
    snap_details = response.json()
    print(snap_details['version'])
    print(snap_details['download_url'])
    print(snap_details['snap_id'])
    print(snap_details['revision'])
else:
    print(f"Error: {response.status_code}")

