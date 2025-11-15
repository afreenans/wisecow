FROM debian:bookworm-slim
RUN apt-get update && \
    apt-get install -y bash cowsay fortune-mod fortunes netcat-openbsd dos2unix && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV PATH="/usr/games:${PATH}"

WORKDIR /app

COPY wisecow.sh .

RUN dos2unix wisecow.sh && chmod +x wisecow.sh

RUN update-alternatives --set nc /bin/nc.openbsd

EXPOSE 4499

ENTRYPOINT ["bash", "./wisecow.sh"]



