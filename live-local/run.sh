# !/bin/bash

# The script clones babajka-backend and babajka-frontend repositories
# and runs them locally with docker composition.

rm -rf tmp
mkdir tmp
cd tmp

git clone https://github.com/babajka/babajka-backend.git
cp "${BABAJKA_SECRET}" babajka-backend/

git clone https://github.com/babajka/babajka-frontend.git

docker-compose up --build

# Babajka is now available on :49170 port.
