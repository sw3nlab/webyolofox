if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <image> <search>"
    echo "example: ./detect.sh image.jpg car"
    exit 1
fi 
./eye model/yolov5.rknn $1 |grep $2|wc -l 
