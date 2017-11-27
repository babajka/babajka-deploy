# !/bin/bash

rm -rf tmp

mkdir tmp

cp "${BABAJKA_SECRET}" tmp/secret.json

docker build -t babajka/all .

docker run -p 3000:3000 babajka/all
