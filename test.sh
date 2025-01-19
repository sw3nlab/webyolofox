while true
do
v4l2-ctl --device /dev/video0 --set-fmt-video=width=width,height=height,pixelformat=MJPG --stream-mmap --stream-to=output.jpg --stream-count=1 >/dev/null
./eye model/yolov5.rknn output.jpg >/dev/null
done

