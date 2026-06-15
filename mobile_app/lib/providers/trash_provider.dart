import 'package:flutter/material.dart';

import '../services/mqtt_service.dart';

class TrashProvider extends ChangeNotifier {
  final MqttService mqtt = MqttService();

  bool online = false;
  bool lidOpen = false;

  int openTime = 5;
  int sensorDistance = 20;

  Future<void> connect() async {
    try {
      await mqtt.connect((message) {
        if (message == '1') {
          lidOpen = true;
        }

        if (message == '0') {
          lidOpen = false;
        }

        notifyListeners();
      });

      online = true;
      notifyListeners();
    } catch (e) {
      online = false;
      notifyListeners();
    }
  }

  void openTrash() {
    mqtt.publish(
      'lixeira/comando',
      '1',
    );
  }

  void closeTrash() {
    mqtt.publish(
      'lixeira/comando',
      '0',
    );
  }

  void setOpenTime(int value) {
    openTime = value;

    mqtt.publish(
      'lixeira/config/open_time',
      value.toString(),
    );

    notifyListeners();
  }

  void setDistance(int value) {
    sensorDistance = value;

    mqtt.publish(
      'lixeira/config/distance',
      value.toString(),
    );

    notifyListeners();
  }
}