#!/usr/bin/env python

import weasyprint
from flask import Flask, make_response, request
from weasyprint import HTML

app = Flask("printer")


@app.route("/version")
def version_index():
    return weasyprint.__version__


@app.route("/")
def home():
    return "<h1>PDF Generator</h1>"


@app.route("/print/", methods=["POST"])
def print_pdf():
    name = request.form.get("filename", "unnamed.pdf")
    html_data = request.form["html"]
    app.logger.info("POST  /print?filename=%s" % name)
    html = HTML(string=html_data)
    pdf = html.write_pdf()
    response = make_response(pdf)
    response.headers["Content-Type"] = "application/pdf"
    response.headers["Content-Disposition"] = "inline;filename=%s" % name
    app.logger.info(" ==> POST  /print?filename=%s  ok" % name)
    return response


if __name__ == "__main__":
    app.run()
