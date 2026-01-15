import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/data/models/pending_inquiries_model.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/data/models/recent_inguiries_model/recent_inguiries_model.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/data/models/symptom_severity_model.dart';
import 'package:diagnosis_project/Feature/DashBoard%20Patient/data/models/topsysmptom_mode.dart';

abstract class DashboardRepo {
  Future<Either<Failure, List<RecentInguiriesModel>>> getrecentinquiries();
  Future<Either<Failure, PendingInquiriesModel>> getpendinginquiriescount();
  Future<Either<Failure, SymptomSeverityModel>> symptomsseverity();
  Future<Either<Failure, TopsysmptomModel>> topsymptom();
}
