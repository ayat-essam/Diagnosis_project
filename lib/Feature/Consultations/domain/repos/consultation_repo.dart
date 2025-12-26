import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/Consultations/domain/entity/consultation_entity%20.dart';
import 'package:dio/dio.dart';

abstract class ConsultationRepo {
  Future<Either<Failure, ConsultationEntity>> getDoctorConsultations();
}
