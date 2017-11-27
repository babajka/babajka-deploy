git clone https://github.com/babajka/babajka-backend.git || exit 1
git clone https://github.com/babajka/babajka-frontend.git || exit 1

cd babajka-backend
echo "Installing BACKEND..."
npm install
echo "Installing FRONTEND..."
cd ../babajka-frontend
npm install
cd ..

mkdir logs

echo "======================="
echo "INSTALLED SUCCESSFULLY."
echo "======================="
