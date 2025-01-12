echo "Start Web-cam 1 FPS..."
fswebcam -q -l 1 -d v4l2:/dev/video0 image.jpg &
sleep 1
echo "Web server starting..."
/var/www/tiny 8080 >/dev/null&
sleep 1
echo "Started on http://localhost:8080/"
sleep 1
echo "Starting yolo..."
sleep 1
/var/www/yolov5/yolo.sh >/dev/null&
sleep 1
echo "yolo started..."
