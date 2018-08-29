FROM python:3.6

ENV PYTHONUNBUFFERED 1 \
    WEB_CONCURRENCY=3 \
    GUNICORN_CMD_ARGS="--max-requests 1200 " \
    DJANGO_SETTINGS_MODULE=tomd.settings.production

COPY ./requirements.txt /code/requirements.txt
RUN pip install -r /code/requirements.txt
RUN pip install gunicorn

# Install Netlify - https://github.com/netlify/netlifyctl
RUN wget -qO- 'https://cli.netlify.com/download/latest/linux' | tar xz

COPY . /code/
WORKDIR /code/

RUN useradd wagtail
RUN chown -R wagtail /code
USER wagtail

CMD ["./run.sh"]
