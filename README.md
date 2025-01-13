# webyolofox
Luckfox pico max object detection and counting solution

### Принцип работы
В данном примере я использовал: 
- плату <b>LuckFox Pico Max с процессором RV1106 и NPU 1TOPs</b>
- USB Хаб с питанием, картридером и несколькими USB портами для расширения возможностей LuckFox Pico
  [!IMAGE](https://github.com/sw3nlab/webyolofox/blob/main/images/tools.jpg)
  
предварительно обученую модель `yolov5.onnx` сконвертированую в формат `yolov5.rknn` и возможностью детектирования 80 различных объектов, которые указаны в файле KOKO.
- На `LuckFox Pico Max` необходимо собрать или загрузить прошивку <b>Buildroot</b>
- Собрать простой webserver 
- Подключить Web-камеру


1) Buildroot firmware
Готовый скомпилированый вариант прошивки можно взять из официального репозитория LuckFox тут
Для самостоятельной сборки прошивки представлен SDK


3) Сборка Web-сервера
В данном примере используется Tiny Web Server [Tiny Web Server](https://github.com/shenfeng/tiny-web-server)
Для его сборки потребуется кросс-компилятор из SDK Rockchip
или можно воспользоваться собраным нами в директории в 

3)Залить файлы из этого репозитория и запустить файл.`/start.sh`



