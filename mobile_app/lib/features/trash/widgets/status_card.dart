import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const StatusCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),

            const SizedBox(width: 16),

            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}