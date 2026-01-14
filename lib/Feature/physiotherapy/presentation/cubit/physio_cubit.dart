import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/submit_video_usecase.dart';
import 'physio_state.dart';

class PhysiotherapyCubit extends Cubit<PhysiotherapyState> {
  final SubmitVideoUseCase submitVideoUseCase;

  PhysiotherapyCubit({required this.submitVideoUseCase})
      : super(const PhysiotherapyInitial());

  Future<void> submitVideo({
    required PlatformFile video,
    required String exerciseName,
  }) async {
    emit(const PhysiotherapyLoading());

    try {
      final result = await submitVideoUseCase.call(
        video: video,
        exerciseName: exerciseName,
      );

      emit(PhysiotherapySuccess(result));
    } catch (e) {
      emit(PhysiotherapyError(e.toString()));
    }
  }

  void resetState() {
    emit(const PhysiotherapyInitial());
  }
}