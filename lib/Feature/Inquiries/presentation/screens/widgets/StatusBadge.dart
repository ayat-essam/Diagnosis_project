import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String text;
  const StatusBadge({required this.text});

  @override
  Widget build(BuildContext context) {
    final isReplied = text.toLowerCase().contains('replied');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isReplied ? Colors.green.shade100 : Colors.orange.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }
}
