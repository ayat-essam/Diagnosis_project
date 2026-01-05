import 'package:diagnosis_project/Feature/DashBoard%20Patient/presention/Widgets/slider_bar.dart';
import 'package:diagnosis_project/Feature/Inquiries/domain/usecases/create_inquiry_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Core/api/dio_consumer.dart';
import 'data/cubit/create_inquiry_cubit.dart';
import 'data/cubit/patient_inquiries_cubit.dart';
import 'data/datasource/inquiry_remote_datasource_imp.dart';
import 'data/repository/inquiry_repository_impl.dart';
import 'domain/usecases/get_patient_inquiries_usecase.dart';
import 'widgets/_InquiryFormCard.dart';
import 'widgets/_StatusCard.dart';
import 'widgets/_SupportAppBar.dart';
import 'widgets/_TrackStatusSection.dart';
import 'widgets/_support_status_row.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/SubmitFunction.dart';

class Inquire extends StatelessWidget {
  const Inquire({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final apiConsumer = DioConsumer(dio: dio);

    final inquiryRemoteDataSource = InquiryRemoteDataSourceImpl(apiConsumer);

    final inquiryRepository =
        InquiryRepositoryImpl(inquiryRemoteDataSource: inquiryRemoteDataSource);

    final createInquiryUseCase = CreateInquiryUseCase(inquiryRepository);

    final getPatientInquiriesUseCase =
        GetPatientInquiriesUseCase(inquiryRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CreateInquiryCubit(createInquiryUseCase),
        ),
        BlocProvider(
          create: (_) => PatientInquiriesCubit(getPatientInquiriesUseCase)
            ..loadInquiries(),
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
    return const Scaffold(
      backgroundColor: Color(0xffF6F7FB),
      appBar: SupportAppBar(),
      drawer: SliderBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SupportStatusRow(),
            SizedBox(height: 16),
            InquiryFormCard(),
            SizedBox(height: 24),
            TrackStatusSection(),
            SizedBox(height: 16),
            // _PreviousRepliesSection(),
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
        StatusCard(
          title: 'Persistent wrist pain',
          status: 'Replied',
          description: '# TKT-2024-1156',
          textButton: "View details",
          onPressed: () {
            submitDialog(context);
          },
        ),
      ],
    );
  }
}
