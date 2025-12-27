import 'dart:io' show File;

import 'package:diagnosis_project/Feature/Inquiries/data/cubit/create_inquiry_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/create_inquiry_usecase.dart';
import '../models/create_inquiry_request.dart';

class CreateInquiryCubit extends Cubit<CreateInquiryState> {
  final CreateInquiryUseCase createInquiryUseCase;

  CreateInquiryCubit(this.createInquiryUseCase)
      : super(CreateInquiryInitial());
  List<File> _files = [];


  void setFiles(List<File> files) {
    _files = files;
    emit(CreateInquiryFilesSelected(files));
  }

 
  Future<void> submitInquiry(CreateInquiryRequest request) async {
    emit(CreateInquiryLoading());
    final updatedRequest = request.copyWith(files: _files);

    final result =
        await createInquiryUseCase(createInquiryRequest: updatedRequest);

    result.fold(
      (error) => emit(CreateInquiryError(error.errorMessage)),
      (message) => emit(CreateInquirySuccess(message)),
    );
  }
}
