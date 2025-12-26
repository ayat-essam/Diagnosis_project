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

  Map<String, dynamic> toJson() => {
        'patientId': patientId,
        'doctorId': doctorId,
        'symptoms': symptoms,
        'notes': notes,
        'files': files!
            .map(
              (file) => MultipartFile.fromFileSync(
                file.path,
                filename: file.path.split('/').last,
              ),
            )
            .toList()
      };
}
