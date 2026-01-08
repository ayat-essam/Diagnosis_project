import 'dart:io';

import 'package:dio/dio.dart';

class CreateInquiryRequest {
  final int doctorId;
  final String? symptoms;
  final String? notes;
  final List<File>? files;

  CreateInquiryRequest({
    required this.doctorId,
    this.symptoms,
    this.notes,
    this.files,
  });

  CreateInquiryRequest copyWith({
    int? doctorId,
    String? symptoms,
    String? notes,
    List<File>? files,
  }) {
    return CreateInquiryRequest(
      doctorId: doctorId ?? this.doctorId,
      symptoms: symptoms ?? this.symptoms,
      notes: notes ?? this.notes,
      files: files ?? this.files,
    );
  }
}
