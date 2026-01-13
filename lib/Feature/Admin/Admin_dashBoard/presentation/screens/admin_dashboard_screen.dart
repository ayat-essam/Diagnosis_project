import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/slider_bar_admin.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_dashBoard/presentation/screens/widgets/admin_bar_chart.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_dashBoard/presentation/screens/widgets/admin_line_chart.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_dashBoard/presentation/screens/widgets/list_view_admin_dashboard_info_container.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/api/dio_consumer.dart';
import '../../../../../Core/reusable_widgets/custom_app_bar_widget.dart';
import '../../data/data source/admin_dashboard_remote_datasource.dart';
import '../../data/repository/admin_dashboard_repo_imp.dart';
import '../../domain/usecases/get_admin_dashboard_usecase.dart';
import '../cubit/admin_dashboard_cubit.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final apiConsumer = DioConsumer(dio: Dio());
    final remoteDataSource = AdminDashboardRemoteDataSourceImpl(apiConsumer);
    final repository =
        AdminDashboardRepositoryImpl(remoteDataSource: remoteDataSource);
    final useCase = GetAdminDashboardUseCase(repository);

    return BlocProvider(
      create: (_) => AdminDashboardCubit(useCase)..getDashboard(),
      child: const _AdminDashboardView(),
    );
  }
}

class _AdminDashboardView extends StatelessWidget {
  const _AdminDashboardView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBarWidget(),
      ),
      drawer: const SliderBarAdmin(),
      body: BlocBuilder<AdminDashboardCubit, AdminDashboardState>(
        builder: (context, state) {
          if (state is AdminDashboardLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AdminDashboardError) {
            return Center(child: Text(state.message));
          }

          if (state is AdminDashboardSuccess) {
            final data = state.data;

            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 INFO CARDS
                    ListViewAdminDashboardInfoContainer(
                      data: data,
                    ),

                    Gap(22.h),
                    Text('Diagnosis Over Time',
                        style: StyleApp.font16BlackRegular),
                    Gap(6.h),
                    Text('Last 6 Months',
                        style: StyleApp.font16BlackRegular
                            .copyWith(color: Colors.grey)),
                    Gap(12.h),

                    /// 🔹 LINE CHART
                    AdminLineChart(
                      diagnosesOverTime: data.diagnosesOverTime,
                    ),

                    Gap(24.h),
                    Text('Top Diagnosis Doctors',
                        style: StyleApp.font16BlackRegular),
                    Gap(6.h),
                    Text('Current Week',
                        style: StyleApp.font16BlackRegular
                            .copyWith(color: Colors.grey)),
                    Gap(11.h),

                    /// 🔹 BAR CHART
                    AdminBarChart(
                      topDoctors: data.topDoctors,
                    ),
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
