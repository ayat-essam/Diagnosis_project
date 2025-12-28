import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/constants/api_constant.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/Consultations/Data/models/consultation_details.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../Domain/repos/cons_repo.dart';

@LazySingleton(as: ConsultationRepo)
class ConsRepoImp implements ConsultationRepo {
  final Dio dio;

  ConsRepoImp(this.dio);

  @override
  Future<Either<Failure, ResponseConsultationDetails>> getConsultationDetails({
    required int ConsId,
    Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dio.get(APIConstants.consultationDetails,
          data: ConsId,

      );
      if(response.statusCode == 200){
       final responseData = response.data;

      if(responseData['success'] == true){
        final details = ResponseConsultationDetails.fromJson(responseData);
        return Right(details);
      }
      else{
        Left(Api)
      }
    }
  }
}