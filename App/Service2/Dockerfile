# Dockerfile per il microservizio 1
FROM python:3.8

WORKDIR /app

COPY App/Service2/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY App/Service2/service2.py .

CMD ["python", "service2.py"]
