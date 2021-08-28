from node:alpine as build-phase
workdir '/app'
copy package.json .
run npm install
copy . .
run npm run build

from nginx
expose 80
copy --from=build-phase /app/build /usr/share/nginx/html