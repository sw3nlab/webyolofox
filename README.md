# webyolofox
Luckfox pico max object detection and counting solution

  ![YOLOv15](https://github.com/sw3nlab/webyolofox/blob/main/images/detect.gif)

### В данном примере я использовал: 
<details>
  <summary>плату <b>LuckFox Pico Max с процессором Rockchip RV1106</b> на архитектуре armhf</summary>
...
123
...

</details>
  
<details>
  <summary>USB Хаб с питанием, картридером и несколькими USB портами для возможности подключения периферийных устройств к LuckFox Pico</summary>
  как то так...
  
  ВНИМАНИЕ! в конфигураторе `luckfox-config` необходимо назначить режим работы USB -> <b>Host</b>
  
  ![IMAGE](https://github.com/sw3nlab/webyolofox/blob/main/images/tools.jpg)
  
  ...
</details>
  
- предварительно обученую модель `yolov5.onnx` сконвертированую в формат `yolov5.rknn` и возможностью детектирования 80 различных объектов, которые указаны в файле koko_80_lable_listlist.

- самую дешёвую noname web-камеру

### Buildroot firmware
Готовый скомпилированый вариант прошивки можно взять из официального [wiki LuckFox](https://drive.google.com/drive/folders/1sFUWjYpDDisf92q9EwP1Ia7lHgp9PaFS?usp=drive_link) выбрав Buildroot для загрузки из Flash или SD карты
- Linux Ядро версии 5.10.160
- для работы с web-камерой подключеной к LuckFox через USB хаб я использую утилиту <b>fswebcam</b>
- для получения изображений с удалённых камер под управлением OpenIPC потребуются утилиты <b>wget</b> или <b>curl</b> (в таком случае Frame Rate детектирования будет ниже за счёт времени запроса к удалённому серверу) 
- для самостоятельной сборки прошивки необходимо использовать [Luckfox SDK](https://github.com/LuckfoxTECH/luckfox-pico)


### Сборка Web-сервера
В данном примере используется [Tiny Web Server](https://github.com/shenfeng/tiny-web-server)
Для его сборки потребуется кросс-компилятор из SDK Luckfox
В этом репозитории в директории `webserver` находится уже собраный бинарник данного Web-сервера

### Запуск детектора с подключеной через USB-хаб web-камерой
Убедится что камера подключена и она нормально определяется системой `lsusb`,`lshw`,`dmesg`
```bash
git clone https://github.com/sw3nlab/webyolofox
cd webyolofox
./start.sh
```
Затем открыть адрес вашей платы `192.168.x.x:8080/index.html`

> Частота обновления изображения (Frame Rate) ~1 кадр в секунду.

Вызов `./stop.sh` последовательно остановит процессы демонов `tiny` и `fswebcam` тем самым завершив работу детектора.

### Запуск детектора на изображение с удалённой web-камеры
```bash
git clone https://github.com/sw3nlab/webyolofox
cd webyolofox/remote
```
Проверить доступность своей камеры по http и указать её адрес в файле `webyolofox/remote/yolo.sh`
Затем стартануть демон
`./start_remote.sh`

> Частота обновления 1 кадр в 5 секунд.

Для остановки используется `./stop_remote.sh`

### CLI Подсчёт объектов в кадре
Для подсчёта объектов используется `./detector.sh` который принимает 2 аргумента, адрес анализируемого изображения `image.jpg` и объект поиска `car`,`person` и т.д. 

![screen](https://github.com/sw3nlab/webyolofox/blob/main/images/screen.jpg)

Если результат выполнения возвращает 0 , то объект на изображении отсутствует.
