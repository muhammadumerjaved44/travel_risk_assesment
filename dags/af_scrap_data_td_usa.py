# -*- coding: utf-8 -*-
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import datetime, timedelta
from airflow.utils.dates import days_ago
import os

seven_days_ago = datetime.combine(datetime.today() - timedelta(7),
                                  datetime.min.time())
now = datetime.now()
now_plus_10 = datetime.now() - timedelta(minutes=15)

min_10 = days_ago(1, minute=10)
dir_path = os.path.abspath(os.path.dirname(__file__))
parent_path = os.path.abspath(os.path.join(dir_path, os.pardir))
#parent_path_1 = os.path.abspath(os.path.join(parent_path, os.pardir))
file_path = parent_path+'/'+'scrap_data_td_usa.py'
print(file_path)



args = {
    'owner': 'Airflow',
    'start_date': days_ago(2),
}

dag = DAG(
    dag_id="af_scrap_data_td_usa",
    default_args=args,
    schedule_interval="@once",
    tags=['td_usa_alerts']
)

#run_this = PythonOperator(
#    task_id='print_the_context',
#    provide_context=True,
#    python_callable=print_context,
#    dag=dag)

t1 = BashOperator(
task_id='af_scrap_data_td_usa',
bash_command=f'python {file_path}',
dag=dag)

t1

#if __name__ == "__main__":
#    dag.cli()
