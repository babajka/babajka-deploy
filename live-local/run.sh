# !/bin/bash

# The script clones babajka-backend and babajka-frontend repositories,
# checkouts live branches and runs them locally.

rm -rf tmp
mkdir tmp
cd tmp

git clone https://github.com/babajka/babajka-backend.git
cd babajka-backend
git checkout live
cd ..

git clone https://github.com/babajka/babajka-frontend.git
cd babajka-frontend
git checkout live
cd ..

cp "${BABAJKA_SECRET}" babajka-backend/

docker-compose up --build

# Babajka is now available on :49170 port.
