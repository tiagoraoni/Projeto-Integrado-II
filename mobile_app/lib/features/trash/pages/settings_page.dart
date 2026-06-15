import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/trash_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<TrashProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Tempo de abertura: '
              '${provider.openTime}s',
            ),

            Slider(
              value: provider.openTime.toDouble(),
              min: 1,
              max: 10,
              divisions: 9,
              label: '${provider.openTime}s',
              onChanged: (value) {
                provider.setOpenTime(
                  value.toInt(),
                );
              },
            ),

            const SizedBox(height: 30),

            Text(
              'Distância do sensor: '
              '${provider.sensorDistance} cm',
            ),

            Slider(
              value:
                  provider.sensorDistance.toDouble(),
              min: 10,
              max: 50,
              divisions: 8,
              label:
                  '${provider.sensorDistance} cm',
              onChanged: (value) {
                provider.setDistance(
                  value.toInt(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}