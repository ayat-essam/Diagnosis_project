import 'package:diagnosis_project/Feature/Admin/Admin_doctor_profile/presentation/views/widgets/doctor_personal_info_card.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/widgets/ConsultationHistory.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_doctor_profile/presentation/views/widgets/doctor_image.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_profile_entity.dart';
import 'package:flutter/widgets.dart';

class DoctorProfileItem extends StatelessWidget {
  const DoctorProfileItem({
    super.key,
    required this.doctorProfile,
  });

  final DoctorProfileEntity doctorProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DoctorImage(
            doctorProfileEntity: doctorProfile,
          ),
          const SizedBox(
            height: 14,
          ),
          DoctorPersonalInfoCard(
              doctorProfileEntity: doctorProfile),
          const SizedBox(
            height: 14,
          ),
          // DashboardSection(),
          // SizedBox(
          //   height: 14,
          // ),
          ConsultationHistory(consultations: doctorProfile.consultationHistory,),
          const SizedBox(
            height: 14,
          ),
        ]);
  }
}
