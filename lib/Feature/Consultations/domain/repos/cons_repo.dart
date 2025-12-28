import 'package:dartz/dartz.dart';
import '../../../../Core/error/failure.dart';
import '../../Data/models/consultation_details.dart';

abstract class ConsultationRepo{

  Future<Either<Failure, ResponseConsultationDetails>> getConsultationDetails({
    required int ConsId,
    Map<String, dynamic>? queryParams,
});
}