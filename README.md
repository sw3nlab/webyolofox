# webyolofox
Luckfox pico max object detection and counting solution

  ![YOLOv15](https://github.com/sw3nlab/webyolofox/blob/main/images/detect.gif)

### В данном примере я использовал: 
<details>
  <summary>плату <b>LuckFox Pico Max с процессором Rockchip RV1106</b> на архитектуре armhf</summary>
...
возможно будет работать и на других платах этого семейства (пока не проверено)
...

</details>
  
<details>
  <summary>USB Хаб с питанием, картридером и несколькими USB портами для возможности подключения периферийных устройств к LuckFox Pico</summary>
  как то так...
  
  ![IMAGE](https://github.com/sw3nlab/webyolofox/blob/main/images/tools.jpg)
  
  ...
</details>
  
- предварительно обученую модель `yolov5.onnx` сконвертированную в формат `yolov5.rknn` и возможностью детектирования 80 различных объектов, которые указаны в файле `webyolofox/model/koko_80_lable_listlist`.

- самую дешманскую noname USB web-камеру `0c45:6366` с низким разрешением

### Buildroot firmware
Готовый скомпилированый вариант прошивки от производителя можно взять из официального [wiki LuckFox](https://drive.google.com/drive/folders/1sFUWjYpDDisf92q9EwP1Ia7lHgp9PaFS?usp=drive_link) 
выбрав Buildroot и вариант загрузки системы с SD карты

### о прошивке от производителя
- Linux Ядро версии 5.10.160
- для работы с web-камерой подключеной к LuckFox через USB-хаб собрана утилита <b>fswebcam</b>
- для получения изображений с удалённых камер (например под управлением [OpenIPC](https://github.com/OpenIPC) ) потребуются утилиты <b>wget</b> или <b>curl</b> (в таком случае Frame Rate детектирования будет ниже за счёт времени запроса к удалённому серверу) 
- для самостоятельной сборки прошивки и/или её компонентов необходимо использовать [Luckfox SDK](https://github.com/LuckfoxTECH/luckfox-pico)


### Web-сервер
Для данного решения мною собран [Tiny Web Server](https://github.com/shenfeng/tiny-web-server)
в директории `webyolofox/webserver` вы найдёте уже собраный бинарник этого сервера.
Если вы хотите использовать другой веб-сервер, вы можете собрать его сами, для этого вам потребуется кросс-компилятор из SDK Luckfox.

### [WEB] Запуск детектора на изображение с удалённой web-камеры
```bash
git clone https://github.com/sw3nlab/webyolofox
cd webyolofox/
chmod a+x install.sh
./install.sh
cd remote/
```
Проверить доступность своей камеры по http и указать её адрес в файле `webyolofox/remote/eye.sh`
Затем стартануть демон
`./start_remote.sh`

и открыть адрес вашей платы `192.168.x.x:8080/index.html`

> Частота обновления 1 кадр в 5 секунд.

Для остановки используется `./stop_remote.sh`

### [WEB] Запуск детектора с подключеной через USB-хаб web-камерой
ВНИМАНИЕ! в конфигураторе `luckfox-config` необходимо назначить режим работы USB -> <b>Host</b>
Убедится что камера подключена и она нормально определяется системой `lsusb`,`lshw`,`dmesg`
далее...
```bash
git clone https://github.com/sw3nlab/webyolofox
cd webyolofox/
chmod a+x install.sh
./install.sh
./start.sh
```
Затем открыть адрес вашей платы `192.168.x.x:8080/index.html`

> Частота обновления изображения (Frame Rate) ~1 кадр в секунду.

Вызов `./stop.sh` последовательно остановит процессы демонов `tiny` и `fswebcam` тем самым завершив работу детектора.

### [CLI] Подсчёт объектов в кадре
Для подсчёта объектов используется `./detect.sh` который принимает 2 аргумента, адрес анализируемого изображения `image.jpg` и объект поиска `car`,`person` и т.д. 

![screen](https://github.com/sw3nlab/webyolofox/blob/main/images/detect_screen.jpg)

Если результат выполнения возвращает 0 , то объект на изображении отсутствует.
