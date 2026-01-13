import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Core/constants/api_constant.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/data/models/pending_inquiries_model.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/data/models/symptom_severity_model.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/data/models/topsysmptom_mode.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/domain/repo/dashboard_repo.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/data/models/recent_inguiries_model/recent_inguiries_model.dart';
import 'package:dio/dio.dart';

class DashboardRepoImpl implements DashboardRepo {
  ApiConsumer apiConsumer;
  DashboardRepoImpl({required this.apiConsumer});

  final baseUrl = ApiConstants.baseURL;

  @override
  Future<Either<Failure, List<RecentInguiriesModel>>>
      getrecentinquiries() async {
    try {
      var response = await apiConsumer.get('$baseUrl/Inquiry/recent');
      List<RecentInguiriesModel> recentInguirieList = response.map((e) {
        return RecentInguiriesModel.fromJson(response);
      }).toList;

      return right(recentInguirieList);
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PendingInquiriesModel>>
      getpendinginquiriescount() async {
    try {
      final response = await apiConsumer.get('$baseUrl/Inquiry/pending');
      return right(PendingInquiriesModel.fromJson(response));
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SymptomSeverityModel>> symptomsseverity() async {
    try {
      final response = await apiConsumer
          .get('$baseUrl/Consultation/symptom-count-this-week');
      return right(SymptomSeverityModel.fromJson(response));
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TopsysmptomModel>> topsymptom() async {
    try {
      final response =
          await apiConsumer.get('$baseUrl/Consultation/top-symptoms-this-week');

      final model = TopsysmptomModel.fromJson(response);

      return Right(model);
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
