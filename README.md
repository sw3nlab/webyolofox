# webyolofox
Luckfox pico max object detection and counting solution

  ![YOLOv15](https://github.com/sw3nlab/webyolofox/blob/main/images/detect.gif)
### Принцип работы

В данном примере я использовал: 
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
- Linux Ядро версии 5.10.160 
- для получения изображений с удалённых камер под управлением OpenIPC потребуется утилита <b>wget</b> (в таком случае Frame Rate детектирования будет ниже за счёт времени запроса к удалённому серверу) 
- для работы с web-камерой подключеной к LuckFox через USB хаб я использую утилиту <b>fswebcam</b>

Готовый скомпилированый вариант прошивки можно взять из официального [wiki LuckFox](https://drive.google.com/drive/folders/1sFUWjYpDDisf92q9EwP1Ia7lHgp9PaFS?usp=drive_link) выбрав Buildroot для загрузки из Flash или SD карты

Для самостоятельной сборки прошивки необходимо использовать [Luckfox SDK](https://github.com/LuckfoxTECH/luckfox-pico)


### Сборка Web-сервера
В данном примере используется [Tiny Web Server](https://github.com/shenfeng/tiny-web-server)
Для его сборки потребуется кросс-компилятор из SDK Rockchip
или можно воспользоваться нашим бинарником в директории в `webserver`

#Запуск детектора
Убедится что к вашей плате luckfox подключена камера и она определяется `lsusb`,`lshw`,`dmesg`
```bash
git clone https://github.com/sw3nlab/webyolofox
cd webyolofox
./start.sh
```
Залить файлы из этого репозитория и запустить файл.`/start.sh` затем открыть адрес вашей платы `192.168.x.x:8080/index.html`

Frame Rate ~1 кадр в секунду.

### Подсчёт объектов в кадре
Для подсчёта объектов я использовал утилиты `grep` и `wc`
Детектор `./yolov5` принимает на вход 2 параметра, адрес файла `.rknn` модели и анализируемый кадр и возвращает результат в стандартный поток вывода который дальше можно парсить с помощью grep , например так...

![screen](https://github.com/sw3nlab/webyolofox/blob/main/images/screen.jpg)

