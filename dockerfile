FROM ubuntu:18.04

LABEL maintainer="joseph.sze.wong@gmail.com"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

RUN cd /app && python create_tables.py

ENTRYPOINT ["python"]

CMD ["car_api.py"]
