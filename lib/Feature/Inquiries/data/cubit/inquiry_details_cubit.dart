import 'package:diagnosis_project/Feature/Inquiries/data/cubit/inquiry_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagnosis_project/Feature/Inquiries/domain/usecases/get_inquiry_details_usecase.dart';

class InquiryDetailsCubit extends Cubit<InquiryDetailsState> {
  final GetInquiryDetailsUseCase getInquiryDetailsUseCase;

  InquiryDetailsCubit({required this.getInquiryDetailsUseCase})
      : super(InquiryDetailsInitial());

  Future<void> getInquiryDetails({
    required int patientId,
    required int inquiryId,
  }) async {
    emit(InquiryDetailsLoading());

    final result = await getInquiryDetailsUseCase(
      patientId: patientId,
      inquiryId: inquiryId,
    );

    result.fold(
      (error) {
        emit(InquiryDetailsError(error: error.errorMessage));
      },
      (inquiryDetails) {
        emit(InquiryDetailsSuccess(inquiryDetails: inquiryDetails));
      },
    );
  }
}
