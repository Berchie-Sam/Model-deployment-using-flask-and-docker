FROM python:3.9-slim

RUN pip install pipenv

WORKDIR /app

COPY ["Pipfile", "Pipfile.lock", "./"]

RUN pipenv install --deploy --system 

COPY ["model_C=0.01.bin", "Predict.py", "./"]

EXPOSE 9696


ENTRYPOINT ["pipenv", "run", "waitress-serve", "--host=0.0.0.0", "--port=9696", "Predict:app"]

