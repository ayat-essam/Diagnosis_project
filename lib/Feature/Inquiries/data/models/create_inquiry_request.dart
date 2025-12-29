import 'dart:io';

import 'package:dio/dio.dart';

class CreateInquiryRequest {
  final int patientId;
  final int doctorId;
  final String? symptoms;
  final String? notes;
  final List<File>? files;

  CreateInquiryRequest({
    required this.patientId,
    required this.doctorId,
    this.symptoms,
    this.notes,
    this.files,
  });

  CreateInquiryRequest copyWith({
    int? patientId,
    int? doctorId,
    String? symptoms,
    String? notes,
    List<File>? files,
  }) {
    return CreateInquiryRequest(
      patientId: patientId ?? this.patientId,
      doctorId: doctorId ?? this.doctorId,
      symptoms: symptoms ?? this.symptoms,
      notes: notes ?? this.notes,
      files: files ?? this.files,
    );
  }
}
