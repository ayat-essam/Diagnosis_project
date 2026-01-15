import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/entities/treatment_plan.dart';


class TreatmentUseCase {
  final  repository;

  TreatmentUseCase(this.repository);

  Future<Either<Failure, TreatmentPlanEntity>> call(int patientId) {
    return repository.getTreatmentPlan(patientId);
  }
}
