FROM alpine:latest

RUN apk add --no-cache python3-dev \
    && apk add --update py3-pip \
    && apk add git \
    && pip3 install --upgrade pip

WORKDIR /app

COPY . /app/TestAPI
WORKDIR /app/TestAPI
RUN pip3 --no-cache-dir install -r requirements.txt
EXPOSE 5000
ENTRYPOINT ["python3","app.py"]
