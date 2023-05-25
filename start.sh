chmod +x ./frp/frpc
docker-compose up -d
./frp/frpc -c ./frp/frpc.ini &