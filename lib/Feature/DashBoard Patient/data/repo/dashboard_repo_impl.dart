import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Core/constants/api_constant.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/domain/repo/dashboard_repo.dart';
import 'package:dio/dio.dart';

class DashboardRepoImpl implements DashboardRepo {
  ApiConsumer apiConsumer;
  DashboardRepoImpl({required this.apiConsumer});

  final baseUrl = ApiConstants.baseURL;
  @override
  Future<Either<Failure, List<dynamic>>> getpendinginquiriescount() async {
    try {
      final response = await apiConsumer.get('$baseUrl/Inquiry/recent');
      return right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<dynamic>>> getrecentinquiries() async {
    try {
      final response = await apiConsumer.get('$baseUrl/Inquiry/pending');
      return right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<dynamic>>> symptomsseverity() async {
    try {
      final response = await apiConsumer
          .get('$baseUrl/Consultation/symptom-count-this-week');
      return right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<dynamic>>> topsymptom() async {
    try {
      final response =
          await apiConsumer.get('$baseUrl/Consultation/top-symptoms-this-week');
      return right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
