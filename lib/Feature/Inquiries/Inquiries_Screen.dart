import 'package:diagnosis_project/Feature/Inquiries/domain/usecases/create_inquiry_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Core/api/dio_consumer.dart';
import 'data/cubit/create_inquiry_cubit.dart';
import 'data/cubit/patient_inquiries_cubit.dart';
import 'data/cubit/patient_inquiries_state.dart';
import 'data/datasource/inquiry_remote_datasource_imp.dart';
import 'data/repository/inquiry_repository_impl.dart';
import 'domain/usecases/get_patient_inquiries_usecase.dart';
import 'widgets/SectionTitle.dart';
import 'widgets/_InquiryFormCard.dart';
import 'widgets/_StatusCard.dart';
import 'widgets/_SupportAppBar.dart';
import 'widgets/_TrackStatusSection.dart';
import 'widgets/_support_status_row.dart';
class Inquire extends StatelessWidget {
  const Inquire({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final apiConsumer = DioConsumer(dio: dio);

    final inquiryRemoteDataSource =
    InquiryRemoteDataSourceImpl(apiConsumer);

    final inquiryRepository =
        InquiryRepositoryImpl(inquiryRemoteDataSource: inquiryRemoteDataSource);

    final createInquiryUseCase =
        CreateInquiryUseCase(inquiryRepository);

    final getPatientInquiriesUseCase =
        GetPatientInquiriesUseCase(inquiryRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CreateInquiryCubit(createInquiryUseCase),
        ),
        BlocProvider(
          create: (_) =>
              PatientInquiriesCubit(getPatientInquiriesUseCase)
                ..loadInquiries(1),
        ),
      ],
      child: const InquiriesScreen(),
    );
  }
}


class InquiriesScreen extends StatelessWidget {
  const InquiriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: const SupportAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            SupportStatusRow(),
            SizedBox(height: 16),
            InquiryFormCard(),
            SizedBox(height: 24),
            TrackStatusSection(),
            SizedBox(height: 16),
            _PreviousRepliesSection(),
          ],
        ),
      ),
    );
  }
}

class _PreviousRepliesSection extends StatelessWidget {
  const _PreviousRepliesSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Previous Replies'),
        SizedBox(height: 8),
        BlocBuilder<PatientInquiriesCubit, PatientInquiriesState>(
          builder: (context, state) {
            if (state is PatientInquiriesLoading) {
              return CircularProgressIndicator();
            }
            if (state is PatientInquiriesLoaded) {
              return Column(
                children: state.inquiries.map((inquiry) {
                  return StatusCard(
                    title: inquiry.symptoms ?? '',
                    status: inquiry.status ?? '',
                    description: '# ${inquiry.inquiryId}',
                    textButton: 'View Details',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('Inquiry details will be available soon'),
                        ),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => InquiryDetailsScreen(
                      //       inquiryId: inquiry.inquiryId,
                      //     ),
                      //   ),
                      // );
                    },
                  );
                }).toList(),
              );
            }
            return SizedBox();
          },
        )

        // StatusCard(
        //   title: 'Long wait time at clinic',
        //   status: 'Replied',
        //   description: '# TKT-2024-1156',
        //   // 'We appreciate your understanding. As a gesture of goodwill, we\'d like to offer you priority scheduling for your next visit.',
        //   textButton: "View full conversation",
        // ),
      ],
    );
  }
}
