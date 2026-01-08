import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Core/services/api_services.dart';
import 'package:diagnosis_project/Feature/Consultations/data/models/doctor_consultations_model.dart';
import 'package:diagnosis_project/Feature/Consultations/domain/entity/doctor_consultations_entity%20.dart';
import 'package:diagnosis_project/Feature/Consultations/domain/repos/consultation_repo.dart';
import 'package:dio/dio.dart';

class ConsultationRepoImpl extends ConsultationRepo {
  final ApiServices apiServices;

  ConsultationRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, List<DoctorConsultationsEntity>>>
      getDoctorConsultations({required int doctorId}) async {
    try {
      var response =
          await apiServices.get(endPoint: '/Consultation/doctor/$doctorId');
      final List<DoctorConsultationsEntity> consultationsList =
          (response as List)
              .map((e) => DoctorConsultationsModel.fromJson(e))
              .toList();
      log('$consultationsList');
      return Right(consultationsList);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}
