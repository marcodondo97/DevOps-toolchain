# Dockerfile per il microservizio 1
FROM python:3.8

WORKDIR /app

COPY App/Service1/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
#ciao
COPY App/Service1/service1.py .

CMD ["python", "service1.py"]
