FROM alpine: latest

RUN apk add --no-cache python3-dev \
aa apk add --update py3-pip \
aa apk add git \
&& pip3 install --upgrade pip

WORKDIR /app
RUN /home/syam/Test_Repo
RUN pip3 --no-cache-dir install - EXPOSE 5000
ENTRYPOINT ["python3","app.py"]
