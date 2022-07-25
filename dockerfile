FROM apache/airflow:2.2.4-python3.8
RUN pip install dbt-core==1.0.0 \
                dbt-postgres==1.0.0

COPY scripts_airflow/init.sh /init.sh
USER root
RUN sudo chmod +x /init.sh
USER airflow

ENTRYPOINT ["/usr/bin/dumb-init", "--", "/init.sh"]
