# Dockerfile api gateway
FROM python:3.8

WORKDIR /app

COPY App/Apigateway/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY App/Apigateway/apigateway.py .

CMD ["python", "apigateway.py"]
