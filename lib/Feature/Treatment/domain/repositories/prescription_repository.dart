

import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/entities/prescription_entity.dart';


abstract class PrescriptionRepository {
  Future<Either<Failure, void>> addPrescription(
      PrescriptionEntity entity, int patientId);
}
