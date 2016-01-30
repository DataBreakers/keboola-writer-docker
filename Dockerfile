FROM quay.io/keboola/base-php56
MAINTAINER databreakers

#test data
#COPY /test_data /home/test_data

WORKDIR /home/app

# Initialize
RUN git clone https://github.com/DataBreakers/keboola-writer.git .
RUN composer install --no-interaction

ENTRYPOINT php ./src/run.php --data=/data
#ENTRYPOINT php ./src/run.php --data=/home/test_data