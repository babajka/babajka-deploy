# /bin/bash

rm -rf tmp

mkdir tmp

cp "${BABAJKA_SECRET}" tmp/secret.json

heroku container:login

heroku container:push web --app babajka-dev
