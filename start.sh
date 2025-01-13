echo "Start Web-cam 1 FPS..."
fswebcam -q -l 1 -d v4l2:/dev/video0 image.jpg &
sleep 1
echo "Web server starting..."
webserver/tiny 8080 >/dev/null&
sleep 1
echo "Started on http://localhost:8080/"
sleep 1
echo "Starting web-detector..."
sleep 1
./eye.sh >/dev/null&
sleep 1
echo "Web-detector started..."
