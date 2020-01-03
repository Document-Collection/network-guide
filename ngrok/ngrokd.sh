#!/bin/bash

cd /app

./ngrokd -tlsKey=a.key -tlsCrt=a.pem -domain="${DOMAIN}" -httpAddr=":6060" -httpsAddr=":6061" -tunnelAddr=":6062"