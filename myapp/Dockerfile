
FROM python:3.9-slim
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN pip install requests boto3 mysql-connector-python

ENV AWS_REGION="ap-southeast-2"
ENV SNS_TOPIC_ARN="arn:aws:sns:ap-southeast-2:345594567556:E-mail-for-game-links"


CMD ["python3", "main.py"]
