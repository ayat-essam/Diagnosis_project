import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/Consultation_form.dart';

import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/StatusDropdown.dart';

import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/consultation_item.dart';
import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/custom_search_consultations.dart';
import 'package:flutter/material.dart';

class ConsultationsSection extends StatelessWidget {
  const ConsultationsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const gradient = LinearGradient(
      colors: [
        Color(0xffC6D8FD),
        Color(0xff207EFF),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 29),
      child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(1.7),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xffF7F7F7),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Consultations',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackSecondary,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      'Manage incoming requests, review AI suggestions and finalize patient diagnoses.',
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          color: Color(0xff6B6B6B),
                          fontWeight: FontWeight.w400)),
                  SizedBox(
                    height: 21,
                  ),
                  StatusDropdown(),
                  SizedBox(
                    height: 21,
                  ),
                  CustomConsultationSearch(),
                  SizedBox(
                    height: 21,
                  ),
                  ConsultationForm(),
                  SizedBox(
                    height: 43,
                  ),
                  ConsultationItem()
                ],
              ))),
    );
  }
}
