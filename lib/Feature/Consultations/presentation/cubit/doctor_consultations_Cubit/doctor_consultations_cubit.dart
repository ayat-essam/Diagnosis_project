import 'package:bloc/bloc.dart';
import 'package:diagnosis_project/Feature/Consultations/domain/entity/doctor_consultations_entity%20.dart';
import 'package:diagnosis_project/Feature/Consultations/domain/repos/consultation_repo.dart';
import 'package:meta/meta.dart';

part 'doctor_consultations_state.dart';

class DoctorConsultationsCubit extends Cubit<DoctorConsultationsState> {
  DoctorConsultationsCubit(this.consultationRepo)
      : super(DoctorConsultationsInitial());
  final ConsultationRepo consultationRepo;
  Future<void> getDoctorConsultations({required int doctorId}) async {
    emit(DoctorConsultationsLoading());
    var result =
        await consultationRepo.getDoctorConsultations(doctorId: doctorId);
    result.fold((failure) {
      emit(DoctorConsultationsFailure(errmessage: failure.errMessge));
    }, (consultationList) {
      emit(DoctorConsultationsSuccess(
          doctorConsultationsList: consultationList));
    });
  }
}
