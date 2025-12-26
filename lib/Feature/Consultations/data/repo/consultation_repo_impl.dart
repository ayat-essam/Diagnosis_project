import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/Consultations/domain/entity/consultation_entity%20.dart';
import 'package:diagnosis_project/Feature/Consultations/domain/repos/consultation_repo.dart';

class ConsultationRepoImpl extends ConsultationRepo {
  @override
  Future<Either<Failure, ConsultationEntity>> getDoctorConsultations() {
    // TODO: implement getDoctorConsultations
    throw UnimplementedError();
  }
}
