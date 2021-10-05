FROM python:3.9.0

WORKDIR /home/

RUN echo "qwer"

RUN git clone https://github.com/00kang/gis_web_mine.git

WORKDIR /home/gis_web_mine/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=gisweb_0628.settings.deploy && python manage.py migrate --settings=gisweb_0628.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=gisweb_0628.settings.deploy gisweb_0628.wsgi --bind 0.0.0.0:8000"]