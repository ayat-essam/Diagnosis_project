import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/Treatment/data/datasources/treatment_remote_datasource.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/entities/treatment_plan.dart';
import 'package:diagnosis_project/Feature/Treatment/domain/repositories/Treatment_repository.dart';

class TreatmentRepositoryImpl implements TreatmentRepository {
  final TreatmentRemoteDataSource remoteDataSource;

  TreatmentRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, TreatmentPlanEntity>> getTreatmentPlan(
      int patientId) async {
    try {
      final model = await remoteDataSource.getTreatmentPlan(patientId);
      return Right(model.toEntity());
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}

