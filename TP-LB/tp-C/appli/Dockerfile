FROM python:3
COPY ./requirement.txt /requirement.txt
WORKDIR /
RUN pip install -r requirement.txt
COPY . /
ENTRYPOINT ["python3"]
CMD ["app.py"]

