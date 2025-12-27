import 'dart:io';

abstract class CreateInquiryState {}

class CreateInquiryInitial extends CreateInquiryState {}

class CreateInquiryLoading extends CreateInquiryState {}

class CreateInquirySuccess extends CreateInquiryState {
  final String message;
  CreateInquirySuccess(this.message);
}

class CreateInquiryError extends CreateInquiryState {
  final String error;
  CreateInquiryError(this.error);
}
class CreateInquiryFilesSelected extends CreateInquiryState {
  final List<File> files;
  CreateInquiryFilesSelected(this.files);
}