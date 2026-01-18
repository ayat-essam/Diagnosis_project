import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/entities/treatment_plan.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/repositories/Treatment_repository.dart';

class TreatmentUseCase {
  final TreatmentRepository repository;

  TreatmentUseCase(this.repository);

  Future<Either<Failure, TreatmentPlanEntity>> call(int id) async {
    return await repository.getTreatmentPlan(id);
  }
}
