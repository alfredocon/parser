FROM node:20-slim

# Codice in /opt/parser (fuori dal volume mount /app di Bunny)
WORKDIR /opt/parser
COPY parser.bundle.js .
COPY pack.json .

# Dipendenze runtime (non bundlate: @aws-sdk/client-s3)
COPY package.json .
RUN npm install --production

# Dati iniziali da git (copiati su volume /app al primo avvio)
COPY domain/ /opt/domain/
COPY output/ /opt/output/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
