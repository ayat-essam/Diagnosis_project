import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/entities/doctor_dashboard_entity.dart';
import '../domain/usecases/get_doctor_dashboard_usecase.dart';

part 'doctor_dashboard_state.dart';

class DoctorDashboardCubit extends Cubit<DoctorDashboardState> {
  final GetDoctorDashboardUseCase getDoctorDashboardUseCase;

  DoctorDashboardCubit(this.getDoctorDashboardUseCase)
      : super(DoctorDashboardInitial());

  Future<void> getDashboard() async {
    emit(DoctorDashboardLoading());
    try {
      final data = await getDoctorDashboardUseCase();
      emit(DoctorDashboardSuccess(data));
    } catch (e) {
      emit(DoctorDashboardError(e.toString()));
    }
  }
}
