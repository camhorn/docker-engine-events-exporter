FROM python:3.10-alpine

ADD docker /opt/events-notifier
WORKDIR /opt/events-notifier
RUN apk update
RUN apk add curl
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "-u", "./events_notifier_prom.py"]
HEALTHCHECK --timeout=3s CMD curl -s -f http://localhost:9000/metrics > /dev/null|| exit 1
