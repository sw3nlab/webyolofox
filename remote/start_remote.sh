echo "Web server starting..."
../webserver/tiny 8080 >/dev/null&
sleep 1
echo "Started on http://localhost:8080/"
sleep 1
echo "Starting REMOTE detector..."
sleep 1
./yolo.sh >/dev/null&
sleep 1
echo "Remote Detector started..."
