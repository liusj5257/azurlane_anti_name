from github import Github
import requests
import rarfile
import os

# Create a Github instance without an access token
g = Github()

# Get the specified repository
repo = g.get_repo("taofan233/azurlane_uncensored")

# Get the latest release
latest_release = repo.get_latest_release()

# Get the release's assets
assets = latest_release.get_assets()

# Get the first asset (assuming it's the one you want)
asset = assets[0]

# Get the asset's download URL
url = asset.browser_download_url

# Download the asset using requests
r = requests.get(url)

# Save the asset to a file
filename = "asset.rar"
with open(filename, "wb") as f:
    f.write(r.content)

# Extract the rar file to the current directory
with rarfile.RarFile(filename, 'r') as rar_ref:
    rar_ref.extractall(os.getcwd())

for root, dirs, files in os.walk(os.getcwd()):
    for file in files:
        old_path = os.path.join(root, file)
        name, ext = os.path.splitext(old_path)
        if not ext:
            new_path = old_path + ".ys"
            os.rename(old_path, new_path)
            print(new_path)
