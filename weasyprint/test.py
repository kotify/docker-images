#!/usr/bin/env python3
import subprocess
import tempfile
import urllib.parse
import urllib.request

HTML = """<html><body>
<h1>Testing PDF</h1>
<p>Some text</p>
</body></html>"""
data = urllib.parse.urlencode({"html": HTML, "filename": "testing.pdf"})
data = data.encode("ascii")
with urllib.request.urlopen("http://localhost:8139/print/", data) as f:
    output = tempfile.NamedTemporaryFile(delete=False, suffix=".pdf")
    output.write(f.read())
print(f"PDF written to:\n{output.name}")
text = subprocess.check_output(
    f"pdftotext {output.name} -", stderr=subprocess.STDOUT, shell=True
)
print(f'Text view of the pdf:\n{"*"*80}')
print(text.decode("utf8"))
print("*" * 80)
