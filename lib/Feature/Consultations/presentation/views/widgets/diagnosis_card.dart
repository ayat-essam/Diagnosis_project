import 'package:flutter/material.dart';

class DiagnosisCard extends StatelessWidget {
  const DiagnosisCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.blue.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Aisha Mohamed",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "34 • 5/12/2025 10:30 AM",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
            const SizedBox(height: 6),
            Text(
              "model: RespNet v1.2 • Inputs: symptoms + CXR",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
            ),

            const SizedBox(height: 12),

            /// Chief Complaint
            _sectionTitle("Chief Complaint"),
            _boxedText(
              "Fever, cough, and shortness of breath for 2 days. Recent travel.",
            ),

            /// Files
            _sectionTitle("Files & Images"),
            _fileItem("cbc_results.pdf", isPdf: true),
            const SizedBox(height: 6),
            _fileItem("chest_xray.jpg"),

            /// Response
            _sectionTitle("Response"),
            _boxedText("COVID-19"),

            /// Diagnosis
            _sectionTitle("Doctor Notes / Final Diagnosis"),
            _boxedText("Viral Upper Respiratory Infection"),

            const SizedBox(height: 12),

            /// Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _actionIcon(
                  icon: Icons.check,
                  color: Colors.green,
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                _actionIcon(
                  icon: Icons.edit,
                  color: Colors.blue,
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                _actionIcon(
                  icon: Icons.delete,
                  color: Colors.red,
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _boxedText(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(fontSize: 13)),
    );
  }

  Widget _fileItem(String name, {bool isPdf = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            isPdf ? Icons.picture_as_pdf : Icons.image,
            color: isPdf ? Colors.red : Colors.blue,
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 13),
            ),
          ),
          Text(
            isPdf ? "PDF" : "Image",
            style: TextStyle(
              color: isPdf ? Colors.red : Colors.blue,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionIcon({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: color.withOpacity(0.15),
        child: Icon(icon, color: color, size: 18),
      ),
    );
  }
}
