import 'package:flutter/material.dart';

import '../widgets/action_button.dart';
import '../widgets/status_card.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lixeira Inteligente'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const StatusCard(
              title: 'ONLINE',
              icon: Icons.wifi,
              color: Colors.green,
            ),

            const SizedBox(height: 16),

            const StatusCard(
              title: 'FECHADA',
              icon: Icons.delete,
              color: Colors.grey,
            ),

            const SizedBox(height: 24),

            ActionButton(
              title: 'ABRIR LIXEIRA',
              icon: Icons.lock_open,
              onPressed: () {},
            ),

            const SizedBox(height: 12),

            ActionButton(
              title: 'FECHAR LIXEIRA',
              icon: Icons.lock,
              onPressed: () {},
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