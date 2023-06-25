#!/bin/sh

set -e

echo "SED the main.js"
ME=$(basename $0)

auto_envsubst() {
sed -i 's/dev2.dev2.com/devk.example.com/g' /usr/share/nginx/html/main.js
sed -i 's/b64849d4-0437-483a-938c-157b5b7b4b84/bae5d142-ddec-4024-a04c-5edef08b300a/g' /usr/share/nginx/html/main.js
sed -i 's/0@K?S*V2h3dJf1j[XKYE]Mrp5XG@.rVQ/cMq1Zsc+0m0qe1R\/lyWvF2j6RYSgRMpD8iAKqPlo134=/g' /usr/share/nginx/html/main.js
}

auto_envsubst

exit 0
