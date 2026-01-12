import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/failure.dart';

abstract class DashboardRepo {
  Future<Either<Failure, List>> getrecentinquiries();
  Future<Either<Failure, List>> getpendinginquiriescount();
  Future<Either<Failure, List>> symptomsseverity();
  Future<Either<Failure, List>> topsymptom();
}
