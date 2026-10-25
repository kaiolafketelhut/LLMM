import re

file_path = 'index.html'
with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

iframe_code = """
<hr>
<h2>🖨️ Verified System Manifest Binaries</h2>
<iframe src="system_manifest.html" style="width: 100%; height: 500px; border: none; background: #000; color: #fff;"></iframe>
</body>
"""

# Check if we already injected it to prevent duplicates
if "system_manifest.html" not in content:
    # Replace the closing </body> tag with our iframe + </body>
    content = content.replace("</body>", iframe_code)
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)
    print(" -> Successfully injected iframe into index.html")
else:
    print(" -> Iframe already exists in index.html")
