FROM alpine:3.10
ENV PYTHONUNBUFFERED 1

RUN apk add --no-cache python3 cairo pango jpeg-dev \
    && apk add --no-cache --virtual build-dependencies build-base linux-headers pcre-dev python3-dev libffi-dev musl-dev zlib-dev gcc glib msttcorefonts-installer ca-certificates \
    && update-ms-fonts \
    && fc-cache -f \
    && pip3 install --upgrade pip \
    && pip3 install certifi flask weasyprint gunicorn
RUN apk del build-dependencies \
    && rm -rf /var/cache/apk/* /tmp/* /root/.cache/pip && find /usr/lib/python3.7 -name '*.pyc' -delete

COPY wsgi.py /opt/wsgi.py

WORKDIR /opt

EXPOSE 8139

CMD [ "gunicorn", "-b", "8139", "wsgi:app" ]
