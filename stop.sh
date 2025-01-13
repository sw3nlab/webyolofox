echo "Stop Detector.."
eye=$(ps |grep eye.sh|awk '{print $1}')
echo $eye
kill -9 $eye
sleep 1
echo "Stop the WEB-Server..."
tiny=$(pidof tiny)
echo $tiny
trap 'kill -9 $tiny' SIGINT SIGTERM EXIT
sleep 1
echo "STOP web-camera"
sleep 1
kill -9 $(pidof fswebcam)
echo "all process killed, check ps"
