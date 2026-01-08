
import 'dart:developer';

// lib/features/consultation/data/repositories/consultation_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/constants/api_constant.dart';
import 'package:diagnosis_project/Feature/Consultations/Data/Mapper/consultation_mapper.dart';
import 'package:dio/dio.dart';
import '../../../../Core/error/failure.dart';
import '../../Domain/entity/consultation.dart';
import '../../domain/entities/consultation.dart';
import '../../domain/repositories/consultation_repository.dart';
import '../../../core/error/failures.dart';
import '../models/consultation_model.dart';
import '../mappers/consultation_mapper.dart';
import '../models/conultation_model.dart';

class ConsultationRepositoryImpl implements ConsultationRepository {
  final Dio dio;

  ConsultationRepositoryImpl(this.dio);

  @override
  Future<Either<Failure, Consultation>> getConsultationDetails(int id) async {
    try {
      final response = await dio.get(
       ApiConstants.consultationDetails,
      );

      final model = ConsultationModel.fromJson(response.data);

      final consultation = model.toEntity;

      if (consultation.success) {
        return Right(consultation);
      } else {
        return Left(ServerFailure(consultation.errorMessage ?? 'API returned success: false'));
      }
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Consultation>>> getAllConsultations() async {
    try {
      final response = await dio.get('/Consultation/list');

      // Assuming response.data is a List
      final List<dynamic> data = response.data;
      final models = data
          .map((json) => ConsultationModel.fromJson(json))
          .toList();

      final consultations = models.toEntities;

      return Right(consultations);
    } on DioException catch (e) {
      return Left(_handleDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Failure _handleDioError(DioException e) {
    switch (e.response?.statusCode) {
      case 400:
        return BadRequestFailure('Invalid request');
      case 401:
        return UnauthorizedFailure('Please login again');
      case 404:
        return NotFoundFailure('Consultation not found');
      case 500:
        return ServerFailure('Server error');
      default:
        return NetworkFailure('Network error: ${e.message}');
    }
  }
}