chmod +x ./frp/frpc
rm -fr *.log
docker-compose up -d
./frp/frpc -c ./frp/frpc.ini &
python keep.py >> out.log