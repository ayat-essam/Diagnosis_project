import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/Treatment/data/datasources/prescription_remote_datasource.dart';
import 'package:diagnosis_project/Feature/Treatment/data/models/add_prescription_model.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/entities/prescription_entity.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/repositories/prescription_repository.dart';

class PrescriptionRepositoryImpl implements PrescriptionRepository {
  final PrescriptionRemoteDataSource remote;

  PrescriptionRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, void>> addPrescription(
      PrescriptionEntity entity, int patientId) async {
    try {
      final model = AddPrescriptionModel(
        medicationName: entity.medicationName,
        dosage: entity.dosage,
        duration: entity.duration,
        frequency: entity.frequency,
        instructions: entity.instructions,
        notes: entity.notes,
      );

      await remote.getPrescription(model, patientId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
