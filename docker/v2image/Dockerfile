FROM python:3.7-slim
RUN pip install flask
WORKDIR /myapp
COPY app.py /myapp/app.py
CMD [ "python", "/myapp/app.py"]