import 'package:diagnosis_project/Core/reusable_widgets/custom_button.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientCard extends StatelessWidget {
  final PatientEntity patient;

  const PatientCard({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.teal[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: patient.profileImageUrl != null
                ? NetworkImage(patient.profileImageUrl!)
                : const AssetImage("assets/image/patientProfile.png")
                    as ImageProvider,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                patient.fullName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                "Patient ID: ${patient.id}",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              CustomButton(
                text: "View full Profile",
                width: 220.w,
                height: 24.h,
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             AddPrescription()));
                },
                backgroundColor: Color(0xff4682FA),
                textColor: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}
