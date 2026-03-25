FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN pip install gunicorn

COPY app.py .

EXPOSE 5000

#ENV APP_VERSION=1.0.0

#Error one
#CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "app:app"]

# Use python -m to run gunicorn (ensures it's found in PATH)
#CMD ["python", "-m", "gunicorn", "--bind", "[IP_ADDRESS]", "--workers", "2", "app:app"]
CMD ["python", "app.py"]
