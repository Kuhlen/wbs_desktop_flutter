# wbs_desktop

Simple Desktop Application to read Serial Communication from RS232 in Windows using Flutter.
Here I am trying to retrieve weighing data from the Arduino which is plugged into the PC.

## Getting Started

Change the this config in the file `lib\app\modules\home\controllers\serial_controller.dart` to the config you want to read.

```dart
final _baudrate = 115200;
void initializeSerialPort() {
    _port ??= SerialPort("COM5");
    final config = SerialPortConfig();
    config.baudRate = _baudrate;
    config.parity = 0;
    config.bits = 8;
    config.stopBits = 1;
    config.dtr = 1;
    config.rts = 1;
    _port!.config = config;
  }
```

I use the package [flutter_libserialport](https://pub.dev/packages/flutter_libserialport) to read the serial communication.
You can see the documentation in the link.

## Screenshots

<img src="screenshot/wbs-stop.png"><img src="screenshot/wbs-play.png">

## Build

If you want to build this project, you can use this command.

```bash
flutter build windows
```
