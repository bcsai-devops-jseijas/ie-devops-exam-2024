# syntax=docker/dockerfile:1
FROM python:3.9
WORKDIR /code
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY . .
EXPOSE 5000
ENTRYPOINT ["python3", "-m", "flask", "run", "--host=0.0.0.0"]