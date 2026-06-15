import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/trash_provider.dart';
import '../widgets/action_button.dart';
import '../widgets/status_card.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TrashProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lixeira Inteligente'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StatusCard(
              title: provider.online
                  ? 'ONLINE'
                  : 'OFFLINE',
              icon: Icons.wifi,
              color: provider.online
                  ? Colors.green
                  : Colors.red,
            ),

            const SizedBox(height: 16),

            StatusCard(
              title: provider.lidOpen
                  ? 'ABERTA'
                  : 'FECHADA',
              icon: Icons.delete,
              color: provider.lidOpen
                  ? Colors.orange
                  : Colors.grey,
            ),

            const SizedBox(height: 24),

            ActionButton(
              title: 'ABRIR LIXEIRA',
              icon: Icons.lock_open,
              onPressed: provider.openTrash,
            ),

            const SizedBox(height: 12),

            ActionButton(
              title: 'FECHAR LIXEIRA',
              icon: Icons.lock,
              onPressed: provider.closeTrash,
            ),

            const SizedBox(height: 24),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Tempo de abertura',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('${provider.openTime}s'),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Distância do sensor',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${provider.sensorDistance} cm',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SettingsPage(),
                  ),
                );
              },
              icon: const Icon(Icons.settings),
              label: const Text('CONFIGURAÇÕES'),
            ),
          ],
        ),
      ),
    );
  }
}