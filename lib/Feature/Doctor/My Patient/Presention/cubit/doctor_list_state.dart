import 'package:diagnosis_project/Feature/Doctor/My%20Patient/Presention/cubit/doctor_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_doctor_list_usecase.dart';

class DoctorListCubit extends Cubit<DoctorListState> {
  final GetDoctorListUseCase useCase;

  DoctorListCubit(this.useCase) : super(DoctorListInitial());

  void getDoctors() async {
    emit(DoctorListLoading());
    try {
      final doctors = await useCase();
      emit(DoctorListSuccess(doctors));
    } catch (e) {
      emit(DoctorListError(e.toString()));
    }
  }
}
