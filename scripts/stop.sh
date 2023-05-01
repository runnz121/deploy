#!/bin/bash

PORT=8080

PID=$(lsof -t -i:$PORT)

if [ -z "$PID" ]; then
  echo "No process found running on port $PORT"
else
  echo "Killing process $PID running on port $PORT"
  kill $PID
fi