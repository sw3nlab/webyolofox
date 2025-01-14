echo "Install webyolofox... "
echo "chmod files +"
chmod a+x fswebcam detect.sh start.sh stop.sh eye eye.sh webserver/tiny remote/eye remote/eye.sh remote/start_remote.sh remote/stop_remote.sh 
echo "copy libs +"
cp lib/libgd.so.3 lib/libpng16.so.16 lib/libfontconfig.so.1 lib/libjpeg.so.8 /usr/lib/.
mv fswebcam /usr/sbin/.
echo "installation complete"
echo "Please check webcam and run:"
echo "For remote webcam: remote/star_remote.sh"
echo "For usb-webcam: ./start.sh"
