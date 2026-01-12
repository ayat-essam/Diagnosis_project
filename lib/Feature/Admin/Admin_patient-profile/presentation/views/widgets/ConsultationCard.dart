import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_profile_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConsultationCard extends StatelessWidget {
  const ConsultationCard({
    super.key,
    required this.consultationHistoryEntity,
  });
  final ConsultationHistoryEntity consultationHistoryEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 29, bottom: 12, left: 12, right: 10),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: const Color(0xff565656), width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            consultationHistoryEntity.doctorName,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff505050),
                fontSize: 13,
                fontFamily: 'Poppins'),
          ),
          Text(
            consultationHistoryEntity.specialization,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xff6B6B6B),
                fontSize: 10,
                fontFamily: 'Poppins'),
          ),
          const SizedBox(
            height: 21,
          ),
        //  if (isInquire)
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                    border: consultationHistoryEntity.consultationType == 'AI' ? Border.all(color: AppColors.BluePrimary) : Border.all(color: const Color(0xff009947)),
                    color: const Color.fromARGB(255, 178, 219, 178),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    consultationHistoryEntity.consultationType,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Spacer(),
                Text(
                  DateFormat('MMM dd, yyyy').format(DateTime.parse(
                      consultationHistoryEntity.consultationDate)),
                ),
              ],
            ),
          // if (isAI)
          //   Row(
          //     children: [
          //       Container(
          //         margin: const EdgeInsets.only(top: 8.0),
          //         padding:
          //             const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          //         decoration: BoxDecoration(
          //           border: Border.all(color: AppColors.BluePrimary),
          //           color: const Color(0xffC6D8FD),
          //           borderRadius: BorderRadius.circular(8),
          //         ),
          //         child: const Text(
          //           'AI',
          //           style: TextStyle(color: Colors.white),
          //         ),
          //       ),
          //       const Spacer(),
          //       Text(
          //         date,
          //         style: const TextStyle(
          //             fontWeight: FontWeight.w400,
          //             color: Color(0xff6B6B6B),
          //             fontSize: 9,
          //             fontFamily: 'Poppins'),
          //       ),
          //     ],
          //   )
       
        ],
      ),
    );
  }
}
