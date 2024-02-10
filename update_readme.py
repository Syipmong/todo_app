#!/usr/bin/env python3

import requests
import json

def get_latest_release():
    url = "https://api.github.com/repos/Syipmong/todo_app/releases/latest"
    response = requests.get(url)
    release_data = response.json()
    return release_data

def update_readme(release_data):
    # Format release data in Markdown
    markdown_content = f"## Latest Release\n\n"
    markdown_content += f"**Version:** {release_data['tag_name']}\n"
    markdown_content += f"**Release Notes:** {release_data['body']}\n"

    # Update README file
    with open("README.md", "r+") as file:
        readme_content = file.read()
        file.seek(0)
        file.write(markdown_content + "\n\n" + readme_content)

if __name__ == "__main__":
    latest_release = get_latest_release()
    update_readme(latest_release)
