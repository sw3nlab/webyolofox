while true
do
wget -q -O image.jpg http://192.168.2.176/image.jpg
sleep 1
../yolov5 model/yolov5.rknn ../image.jpg
sleep 1
done
