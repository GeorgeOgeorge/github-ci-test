FROM python:3.12-alpine

WORKDIR /app

COPY requirements.txt requirements.txt
COPY run.py run.py
COPY app app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

ENTRYPOINT [ "python", "run.py" ]
