
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/Theme App/colors.dart';
import '../../../../../Core/api/dio_consumer.dart';
import '../../data/data_sources/doctor_remote_data_source.dart';
import '../../data/repository/doctor_repository_impl.dart';
import '../../domain/usecases/get_doctor_list_usecase.dart';
import '../cubit/doctor_list_cubit.dart';
import '../cubit/doctor_list_state.dart';
import 'widgets/custom_bottom_nav.dart';
import 'widgets/doctor_card.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiConsumer = DioConsumer(dio: Dio());
    final remote = DoctorRemoteDataSourceImpl(apiConsumer: apiConsumer);
    final repo = DoctorRepositoryImpl(remoteDataSource: remote);

    return BlocProvider(
      create: (_) => DoctorListCubit(
        GetDoctorListUseCase(repo),
      )..getDoctors(),
      child: const DoctorsScreenView(),
    );
  }
}

class DoctorsScreenView extends StatelessWidget {
  const DoctorsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.2),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Image.asset('assets/image/logo.png'),
            SizedBox(width: 80.w),
            Stack(clipBehavior: Clip.none, children: [
              Icon(Icons.notifications, size: 24.sp, color: Color(0xff231F20)),
              Positioned(
                bottom: 14,
                left: 15,
                child: Container(
                  width: 15.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                    color: AppColors.BluePrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      '5',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ]),
            SizedBox(width: 10.w),
            CircleAvatar(
              radius: 18.r,
              backgroundImage: AssetImage('assets/image/profile.png'),
            ),
            SizedBox(width: 14.w),
          ]),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 14.w,
              ),
              Icon(Icons.arrow_back_ios, size: 25.sp, color: Color(0xff231F20)),
              SizedBox(width: 20.w),
              Text(
                "Doctors",
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff252525),
                ),
              ),
            ],
          ),
          Expanded(
            child: BlocBuilder<DoctorListCubit, DoctorListState>(
              builder: (context, state) {
                if (state is DoctorListLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is DoctorListSuccess) {
                  return ListView.builder(
                    itemCount: state.doctors.length,
                    itemBuilder: (context, index) {
                      final doctor = state.doctors[index];

                      return DoctorCard(
                        name: doctor.name,
                        specialty: doctor.specialization ?? 'General',
                        experience: doctor.experienceYears.toString(),
                        rating: doctor.rating?.toStringAsFixed(1) ?? '0',
                        image: doctor.profileImageUrl?.isNotEmpty == true
                            ? doctor.profileImageUrl!
                            : 'assets/image/doctor_profile.png',
                        onBook: () {},
                        nextAvailable: "Today, 3:00 PM",
                        reviews: "270",
                      );
                    },
                  );
                }

                if (state is DoctorListError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: 2,
        onTap: (index) {
          // setState(() => currentIndex = index);
        },
      ),
    );
  }
}
