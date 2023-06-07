import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_blue_example/widgets.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key? key, required this.device}) : super(key: key);

  final BluetoothDevice device;

  _readData() async {
    var services = await device.discoverServices();
    var characteristics = services.last.characteristics;
    for (BluetoothCharacteristic c in characteristics) {
      List<int> value = await c.read();

      print(value);

      var int8List = new Uint8List.fromList(value);

      print(int8List);

      var number = ByteData.view(Uint8List.fromList(value).buffer).getUint16(0);
      print(number);
    }
  }

  @override
  Widget build(BuildContext context) {
    _readData();
    return Text("Mda...");
  }
}
