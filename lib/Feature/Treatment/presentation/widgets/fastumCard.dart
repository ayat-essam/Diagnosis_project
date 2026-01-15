import 'package:flutter/material.dart';

class FastumCard extends StatelessWidget {
  const FastumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:const  EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.shade100),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.science_outlined, color: Colors.grey),
          SizedBox(width: 10),
          Text("Fastum", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
