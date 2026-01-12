import 'package:diagnosis_project/Feature/Admin/Admin_doctor_profile/presentation/views/widgets/doctor_profile_item.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_profile_entity.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/doctors_management_state.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/doctors_mangement_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GetDoctorProfileBlocBuilder extends StatelessWidget {
  const GetDoctorProfileBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsManagementCubit, DoctorsManagementState>(
      builder: (context, state) {
        if (state is GetDoctorProfileLoading) {
          return Skeletonizer(
            enabled: true,
            child: DoctorProfileItem(
              doctorProfile: DoctorProfileEntity.empty(),
            ),
          );
        } else if (state is GetDoctorProfileError) {
          return Center(child: Text(state.message));
        } else if (state is GetDoctorProfileSuccess) {
          final doctorProfile = state.doctorProfileEntity;
          return DoctorProfileItem(doctorProfile: doctorProfile);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
