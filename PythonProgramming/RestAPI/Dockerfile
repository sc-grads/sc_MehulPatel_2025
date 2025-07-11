FROM python:3.13.3-slim
# EXPOSE 5000
WORKDIR /app
RUN pip install flask 
COPY ./requirements.txt requirements.txt
RUN pip install --no-cache-dir --upgrade -r requirements.txt
COPY app.py .
ENV FLASK_APP=app.py
CMD ["flask","run","--host","0.0.0.0"]
  