import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_bar_widget.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/buttons_taps.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/common_diagnosis_chart.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/new_vs_returning_chart.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/rating_chart.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/row_doctor_dash_board_container.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/slider_bar_doctor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/api/dio_consumer.dart';
import '../../cubit/doctor_dashboard_cubit.dart';
import '../../data/data source/doctor_dashboard_remote_data_source.dart';
import '../../data/repository/doctor_dashboard_repository_impl.dart';
import '../../domain/usecases/get_doctor_dashboard_usecase.dart';

class DoctorDashboardScreen extends StatelessWidget {
  const DoctorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiConsumer = DioConsumer(dio: Dio());
    final remoteDataSource =
        DoctorDashboardRemoteDataSourceImpl(apiConsumer: apiConsumer);
    final repository =
        DoctorDashboardRepositoryImpl(remoteDataSource: remoteDataSource);
    final useCase = GetDoctorDashboardUseCase(repository);

    return BlocProvider(
      create: (_) =>
          DoctorDashboardCubit(useCase)..getDashboard(),
      child: const _DoctorDashboardView(),
    );
  }
}


class _DoctorDashboardView extends StatelessWidget {
  const _DoctorDashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBarWidget(),
      ),
      drawer: const SliderBarDoctor(),
      body: BlocBuilder<DoctorDashboardCubit, DoctorDashboardState>(
        builder: (context, state) {
          if (state is DoctorDashboardLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DoctorDashboardError) {
            return Center(child: Text(state.message));
          }

          if (state is DoctorDashboardSuccess) {
            final data = state.data;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 30.0),
                child: Column(
                  children: [
                    const ButtonsTaps(),
                    Gap(16.h),

                    RowDoctorDashBoardContainer(
                      totalConsultations: data.totalConsultations,
                      totalTreatmentPlans: data.totalTreatmentPlans,
                    ),

                    Gap(16.h),
                    NewVsReturningChart(
                      data: data.newVsReturningPatients,
                    ),

                    Gap(16.h),

                    RatingChart(
                      data: data.ratingStats,
                    ),

                    Gap(16.h),

                    const CommonDiagnosisChart(),
                  ],
                ),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

