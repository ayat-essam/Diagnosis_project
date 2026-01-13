import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/widgets/ConsultationHistory.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/widgets/patient_image.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/widgets/patient_personal_info_card.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_profile_entity.dart';
import 'package:flutter/widgets.dart';

class PatientProfileItem extends StatelessWidget {
  const PatientProfileItem({
    super.key,
    required this.patientEntity,
  });

  final PatientProfileEntity patientEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PatientImage(
            patientProfileEntity: patientEntity,
          ),
          const SizedBox(
            height: 14,
          ),
          PatientPersonalInfoCard(
              patientProfileEntity: patientEntity),
          const SizedBox(
            height: 14,
          ),
          // DashboardSection(),
          // SizedBox(
          //   height: 14,
          // ),
          ConsultationHistory(consultations: patientEntity.consultationHistory,),
          const SizedBox(
            height: 14,
          ),
        ]);
  }
}
