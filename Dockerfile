FROM nodered/node-red

ADD https://github.com/baronbrew/aioblescan/archive/master.zip /build/
ADD https://raw.githubusercontent.com/baronbrew/TILTpi/Aioblescan/flow.json /flows/

USER root

RUN apk update && apk add unzip curl sudo bluez && unzip /build/master.zip -d /build \
    && cd /build/aioblescan-master/ && python3 setup.py install

RUN npm install node-red-dashboard

