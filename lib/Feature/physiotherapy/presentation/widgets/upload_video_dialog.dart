import 'package:diagnosis_project/Feature/physiotherapy/presentation/widgets/result_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../Core/Theme App/Fonts.dart';
import '../../../../Core/Theme App/colors.dart';
import '../../../../Core/reusable_widgets/custom_button.dart';
import '../../../../Core/reusable_widgets/custom_text.dart';
import '../cubit/physio_cubit.dart';
import '../cubit/physio_state.dart';

class UploadVideoDialog extends StatefulWidget {
  final Function(PlatformFile?) onVideoSelected;
  final String? selectedExercise;

  const UploadVideoDialog({
    super.key,
    required this.onVideoSelected,
    required this.selectedExercise,
  });

  @override
  State<UploadVideoDialog> createState() => _UploadVideoDialogState();
}

class _UploadVideoDialogState extends State<UploadVideoDialog> {
  PlatformFile? selectedFile;
  bool _isUploading = false;

  Future<void> _pickVideo() async {
    if (_isUploading) return;

    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowedExtensions: ['mp4'],
    );

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;

      if (file.size > 10 * 1024 * 1024) {
        _showErrorDialog('File size exceeds 10 MB limit');
        return;
      }

      setState(() {
        selectedFile = file;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhysiotherapyCubit, PhysiotherapyState>(
      listener: (context, state) {
        if (state is PhysiotherapyLoading) {
          setState(() => _isUploading = true);
        }
        else if (state is PhysiotherapySuccess) {
          setState(() => _isUploading = false);

          Navigator.pop(context); // close upload dialog

          showDialog(
            context: context,
            builder: (_) => BlocProvider.value(
              value: context.read<PhysiotherapyCubit>(),
              child: ResultDialog(
                result: state.result,
                onClose: () {
                  Navigator.pop(context);
                  widget.onVideoSelected(selectedFile);
                },
              ),
            ),
          );
        }
        else if (state is PhysiotherapyError) {
          setState(() => _isUploading = false);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
          side: const BorderSide(
            color: AppColors.BluePrimary,
            width: 1.5,
          ),
        ),
        elevation: 24,
        child: Container(
          width: 340.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 30,
                offset: Offset(0, 12.h),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Upload icon / loader
                Container(
                  width: 72.w,
                  height: 72.w,
                  decoration: BoxDecoration(
                    color: AppColors.BluePrimary.withOpacity(0.12),
                    shape: BoxShape.circle,
                  ),
                  child: _isUploading
                      ? const CircularProgressIndicator(
                    color: AppColors.BluePrimary,
                    strokeWidth: 3,
                  )
                      : Icon(
                    Icons.cloud_upload_outlined,
                    size: 32.sp,
                    color: AppColors.BluePrimary,
                  ),
                ),
                Gap(12.h),

                CustomText(
                  text: "Upload your Video here",
                  fontSize: 16.sp,
                  fontWeight: Fonts.bold,
                  color: AppColors.grayTextChart,
                ),
                Gap(6.h),

                CustomText(
                  text: "Drag and drop your Video here,\n or click to browse",
                  fontSize: 12.sp,
                  color: AppColors.grayDark,
                ),
                Gap(6.h),

                CustomText(
                  text: "Supported formats: MP4, Maximum size: 10 MB",
                  fontSize: 10.sp,
                  color: AppColors.graySecondary,
                ),
                Gap(16.h),

                /// Selected exercise
                if (widget.selectedExercise != null)
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.BluePrimary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: AppColors.BluePrimary),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.fitness_center,
                          size: 16.sp,
                          color: AppColors.BluePrimary,
                        ),
                        Gap(8.w),
                        CustomText(
                          text:
                          "Selected Exercise: ${widget.selectedExercise}",
                          fontSize: 12.sp,
                          color: AppColors.BluePrimary,
                          fontWeight: Fonts.bold,
                        ),
                      ],
                    ),
                  ),

                if (widget.selectedExercise != null) Gap(12.h),

                /// Pick video
                GestureDetector(
                  onTap: _isUploading ? null : _pickVideo,
                  child: Container(
                    width: double.infinity,
                    height: 80.h,
                    decoration: BoxDecoration(
                      color:
                      _isUploading ? Colors.grey[200] : Colors.grey[50],
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: selectedFile != null
                            ? AppColors.BluePrimary
                            : AppColors.graySecondary,
                        width: 1.5,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: _isUploading
                        ? const CircularProgressIndicator(
                      color: AppColors.BluePrimary,
                      strokeWidth: 2,
                    )
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.video_file_outlined,
                          size: 28.sp,
                          color: selectedFile != null
                              ? AppColors.BluePrimary
                              : AppColors.graySecondary,
                        ),
                        Gap(6.h),
                        CustomText(
                          text:
                          selectedFile?.name ?? "Select Video",
                          fontSize: 14.sp,
                          color: selectedFile != null
                              ? AppColors.BluePrimary
                              : AppColors.graySecondary,
                        ),
                        if (selectedFile != null)
                          Padding(
                            padding:
                            EdgeInsets.only(top: 4.h),
                            child: CustomText(
                              text:
                              "${(selectedFile!.size / 1024 / 1024).toStringAsFixed(2)} MB",
                              fontSize: 10.sp,
                              color: AppColors.graySecondary,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Gap(20.h),

                /// Send button
                BlocBuilder<PhysiotherapyCubit, PhysiotherapyState>(
                  builder: (context, state) {
                    final isEnabled =
                        selectedFile != null &&
                            widget.selectedExercise != null &&
                            state is! PhysiotherapyLoading;

                    return CustomButton(
                      text: state is PhysiotherapyLoading
                          ? "Uploading..."
                          : "Send",
                      backgroundColor: isEnabled
                          ? AppColors.BluePrimary
                          : Colors.grey,
                      textColor: AppColors.whiteBackground,
                      width: double.infinity,
                      height: 40.h,
                      onPressed: isEnabled
                          ? () {
                        context
                            .read<PhysiotherapyCubit>()
                            .submitVideo(
                          video: selectedFile!,
                          exerciseName:
                          widget.selectedExercise!,
                        );
                      }
                          : null,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
