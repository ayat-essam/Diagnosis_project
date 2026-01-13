import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/widgets/ConsultationCard.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_profile_entity.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/gradient_border.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ConsultationHistory extends StatelessWidget {
  const ConsultationHistory({super.key, required this.consultations});
  final List<ConsultationHistoryEntity> consultations;

  @override
  Widget build(BuildContext context) {
    return GradientBorder(
        child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xffF7F7F7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Skeleton.keep(
            child: Text(
              "Consultation history",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff505050),
                  fontFamily: 'Poppins'),
            ),
          ),
          const SizedBox(height: 29),
          consultations.isEmpty
              ? const Center(
                  child: Text(
                    'No consultations yet',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff8A8A8A),
                      fontFamily: 'Poppins',
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: consultations.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final consultation = consultations[index];

                    return ConsultationCard(
                      consultationHistoryEntity: consultation,
                    );
                  },
                ),
        ],
      ),
    ));
  }
}
