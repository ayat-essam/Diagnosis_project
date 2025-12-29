import 'dart:io' show File;

import 'package:diagnosis_project/Feature/Inquiries/data/cubit/create_inquiry_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/create_inquiry_usecase.dart';
import '../models/create_inquiry_request.dart';

class CreateInquiryCubit extends Cubit<CreateInquiryState> {
  final CreateInquiryUseCase createInquiryUseCase;

  CreateInquiryCubit(this.createInquiryUseCase)
      : super(CreateInquiryInitial());

  String? symptoms;
  String? description;
  int? doctorId;
  List<File> files = [];

  void setSymptoms(String value) {
    symptoms = value;
  }

  void setDescription(String value) {
    description = value;
  }

  void setDoctorId(int id) {
  doctorId = id;
  emit(CreateInquiryDoctorSelected(id));
}

  void setFiles(List<File> selectedFiles) {
    files = selectedFiles;
    emit(CreateInquiryFilesSelected(selectedFiles));
  }

Future<void> submitInquiry() async {
  if (doctorId == null) {
    emit( CreateInquiryError('Please select a doctor'));
    return;
  }

  if (symptoms == null || symptoms!.isEmpty) {
    emit( CreateInquiryError('Symptoms is required'));
    return;
  }

  emit(CreateInquiryLoading());

  final request = CreateInquiryRequest(
    patientId: 1,
    doctorId: doctorId!,
    symptoms: symptoms,
    notes: description,
    files: files,
  );

  final result =
      await createInquiryUseCase(createInquiryRequest: request);

  result.fold(
    (error) => emit(CreateInquiryError(error.errorMessage)),
    (message) => emit(CreateInquirySuccess(message)),
  );
}

  
}
