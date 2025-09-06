FROM ghcr.io/openwallet-foundation/acapy-agent:py3.12-1.3.0
USER root
RUN mkdir -p /configs /data
COPY config.yml /configs/config.yml
RUN echo '#!/bin/bash' > /entrypoint.sh && \
    echo 'aca-py start --arg-file /configs/config.yml &' >> /entrypoint.sh && \
    echo 'PID=$!' >> /entrypoint.sh && \
    echo 'echo "ACA-Py started with PID: $PID"' >> /entrypoint.sh && \
    echo 'wait $PID' >> /entrypoint.sh && \
    chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]