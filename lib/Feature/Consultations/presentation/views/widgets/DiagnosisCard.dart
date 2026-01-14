import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/EditDiagnosisDialog.dart';
import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/deletDiagnosisDialog.dart';
import 'package:flutter/material.dart';

class DiagnosisCard extends StatelessWidget {
  const DiagnosisCard({super.key});

  @override
  Widget build(BuildContext context) {
    final gradient = const LinearGradient(
      colors: [
        Color(0xff207EFF),
        Color(0xffC6D8FD),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(1.7),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xffF7F7F7),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Aisha Mohamed",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff4A5565)),
              ),
              const SizedBox(height: 4),
              Text(
                "34 • 5/12/2025 10:30 AM",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff4A5565)),
              ),
              const SizedBox(height: 6),
              Text(
                "model: RespNet v1.2 • Inputs: symptoms + CXR",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff4A5565)),
              ),

              const SizedBox(height: 12),

              /// Chief Complaint
              _sectionTitle("Chief Complaint"),
              _boxedText(
                "Fever, cough, and shortness of breath for 2 days. Recent travel.",
              ),

              /// Files
              _sectionTitle("Files & Images"),
              _fileItem("cbc_results.pdf", 'PDF'),
              const SizedBox(height: 6),
              _fileItem("chest_xray.jpg", "Image"),

              /// Response
              _sectionTitle("Response"),
              SizedBox(
                height: 10,
              ),
              _fileItem("COVID-19", ''),

              /// Diagnosis
              _sectionTitle("Doctor Notes / Final Diagnosis"),
              SizedBox(
                height: 10,
              ),
              _fileItem("Viral Upper Respiratory Infection", ''),

              const SizedBox(height: 15),

              /// Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const EditDiagnosisDialog(),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  _actionIcon(
                    icon: Icons.delete,
                    color: Colors.red,
                    onTap: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const Deletdiagnosisdialog(),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
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
          fontWeight: FontWeight.w700,
          color: Color(0xff4A5565),
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _boxedText(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff4A5565)),
    );
  }

  Widget _fileItem(String name, String? title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xff6B6B6B)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff6B6B6B)),
            ),
          ),
          Text(
            title!,
            style: TextStyle(
              color: AppColors.BluePrimary,
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
        backgroundColor: color,
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}
