#!/usr/bin/env bash
REPOSITORY="/home/ubuntu/deploy_test"
cd $REPOSITORY

APP_NAME="deploy"
JAR_NAME="$(ls $REPOSITORY/build/libs/ | grep 'SNAPSHOT.jar' | tail -n 1)"
JAR_PATH="$REPOSITORY/$JAR_NAME"

CURRENT_PID=$(pgrep -f $APP_NAME)

echo "> $REPOSITORY"
echo "> $JAR_NAME"
echo "> $JAR_PATH"
echo "> $CURRENT_PID"

if [ -z $CURRENT_PID ]
then
  echo "> 종료할것 없음."
else
  echo "> kill -9 $CURRENT_PID"
  kill -15 $CURRENT_PID
  sleep 5
fi

echo "> $JAR_PATH start"
nohup java -jar $JAR_PATH > /dev/null 2> /dev/null < /dev/null &