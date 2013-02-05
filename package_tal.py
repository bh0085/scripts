cd /var/www/tal/tal/public/
../utils/imports.py
cd ../..
git add .
read -p "commit message:" message
git commit -m "$read" -a
git push
