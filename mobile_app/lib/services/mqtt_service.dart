import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  late MqttServerClient client;

  Future<void> connect(
    Function(String message) onMessage,
  ) async {
    final clientId =
        'AppLixeira_${DateTime.now().millisecondsSinceEpoch}';

    client = MqttServerClient.withPort(
      '500e0d23a6204c628621b154e1e96146.s1.eu.hivemq.cloud',
      clientId,
      8883,
    );

    client.secure = true;
    client.keepAlivePeriod = 60;

    client.connectionMessage = MqttConnectMessage()
        .withClientIdentifier(clientId)
        .authenticateAs(
          'lixeira_user',
          'Projetointegrador2',
        )
        .startClean();

    await client.connect();

    client.subscribe(
      'lixeira/status',
      MqttQos.atLeastOnce,
    );

    client.updates?.listen((messages) {
      final recMess =
          messages[0].payload as MqttPublishMessage;

      final payload =
          MqttPublishPayload.bytesToStringAsString(
        recMess.payload.message,
      );

      onMessage(payload);
    });
  }

  void publish(
    String topic,
    String message,
  ) {
    final builder = MqttClientPayloadBuilder();

    builder.addString(message);

    client.publishMessage(
      topic,
      MqttQos.atLeastOnce,
      builder.payload!,
    );
  }
}