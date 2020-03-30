FROM continuumio/miniconda3

# activate conda enviorment
RUN /bin/sh -c conda activate base
ENV CURRENT_DIR /ITIRA
WORKDIR /ITIRA
# COPY requirements.txt .
# RUN pip install -r requirements.txt
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    devscripts \
    equivs \
    git-buildpackage \
    git \
    lsb-release \
    make \
    openssh-client \
    pristine-tar \
    wget \
    unzip \
    xvfb \
    libxi6 \
    libgconf-2-4

ENV AIRFLOW_HOME=/ITIRA/airflow
RUN pip install apache-airflow
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip freeze > requirements.txt
RUN conda install -c bioconda mysqlclient
RUN pip install psycopg2-binary
RUN conda install -c conda-forge pymysql
RUN pip install 'apache-airflow[mysql,postgres,gcp]'


ENV CONDA_PACKAGES="\
    anaconda::pyodbc"

RUN conda install $CONDA_PACKAGES

# uncomment next 2 lines if you want to use 'docker-compose-volume-packages.yml'
# RUN mkdir /usr/local/airflow/packages
COPY . /ITIRA
# COPY ./postgres_data /ITIRA/postgres_data
COPY .files/airflow.cfg /ITIRA/airflow/airflow.cfg
COPY ./dags /ITIRA/airflow/dags
# COPY ./chrome_driver /ITIRA/chrome_driver
RUN chown -R 777 /ITIRA
RUN chown -R 777 /ITIRA/airflow
RUN chown -R 777 /ITIRA/dags
RUN chown -R 777 /ITIRA/
RUN chown -R 777 /ITIRA/airflow/airflow.cfg
