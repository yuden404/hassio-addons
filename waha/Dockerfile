ARG BUILD_FROM
FROM ${BUILD_FROM}

ENV WAHA_DEFAULT_SESSION=default
ENV WAHA_LOCAL_STORE_BASE_DIR=/data/.sessions

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
