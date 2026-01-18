
import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/entities/treatment_plan.dart';

abstract class TreatmentRepository {
  Future<Either<Failure, TreatmentPlanEntity>> getTreatmentPlan(int patientId);
}

