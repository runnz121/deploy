echo "> kill port 8080"
pid=$(lsof -i:8080 -t); kill -9 $pid