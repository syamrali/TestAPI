FROM alpine:latest

RUN apk add --no-cache python3-dev \
&& apk add --update py3-pip \
&& apk add git \
&& pip3 install --upgrade pip

WORKDIR /app

RUN git clone https://github.com/syamrali/TestAPI.git
WORKDIR /app/TestAPI
RUN pip3 --no-cache-dir install -r requirements.txt
EXPOSE 5000
ENTRYPOINT ["python3","app.py"]
