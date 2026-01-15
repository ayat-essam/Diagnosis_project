

import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/entities/prescription_entity.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/repositories/prescription_repository.dart';

class AddPrescriptionUseCase {
  final PrescriptionRepository repository;

  AddPrescriptionUseCase(this.repository);

  Future<Either<Failure, void>> call(
      PrescriptionEntity entity, int patientId) {
    return repository.addPrescription(entity, patientId);
  }
}
