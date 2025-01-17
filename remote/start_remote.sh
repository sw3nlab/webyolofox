echo "Web server starting..."
../webserver/tiny 8080 >/dev/null&
sleep 1
echo "Tiny Started on port 8080"
sleep 1
echo "Starting REMOTE detector..."
sleep 1
./eye.sh >/dev/null&
sleep 1
echo "Remote Detector started..."
