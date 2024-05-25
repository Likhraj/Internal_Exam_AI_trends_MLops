FROM continuumio/anaconda3:latest
FROM python:3.8

WORKDIR /app

COPY . /app

RUN pip install numpy pandas scikit-learn

Expose 80

CMD ["python","model.py"]







