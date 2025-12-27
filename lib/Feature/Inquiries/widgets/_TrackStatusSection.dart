// ---------------- Track Status ----------------
import 'package:diagnosis_project/Feature/Inquiries/data/cubit/patient_inquiries_cubit.dart';
import 'package:diagnosis_project/Feature/Inquiries/data/cubit/patient_inquiries_state.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/SectionTitle.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/_StatusCard.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/dialogCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackStatusSection extends StatelessWidget {
  const TrackStatusSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Track Status'),
        SizedBox(height: 8),
        BlocBuilder<PatientInquiriesCubit, PatientInquiriesState>(
          builder: (context, state) {
            if (state is PatientInquiriesLoading) {
              return CircularProgressIndicator();
            }
            if (state is PatientInquiriesLoaded) {
              if (state.inquiries.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'No inquiries yet',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                );
              }
              return Column(
                children: state.inquiries.map((inquiry) {
                  return StatusCard(
                    title: inquiry.symptoms ?? '',
                    status: inquiry.status ?? '',
                    description: '# ${inquiry.inquiryId}',
                    textButton: 'View Details',
                    onPressed: () {
                      dialogProgress(
                        context,
                        patientId: 1,
                        inquiryId: inquiry.inquiryId,
                      );
                    },
                  );
                }).toList(),
              );
            }
            if (state is PatientInquiriesError) {
              return Text(state.error);
            }
            return SizedBox();
          },
        ),
      ],
    );
  }
}
