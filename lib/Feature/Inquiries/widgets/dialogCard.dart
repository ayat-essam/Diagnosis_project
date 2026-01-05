import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/api/dio_consumer.dart';
import 'package:diagnosis_project/Feature/Inquiries/data/cubit/inquiry_details_cubit.dart';
import 'package:diagnosis_project/Feature/Inquiries/data/cubit/inquiry_details_state.dart';
import 'package:diagnosis_project/Feature/Inquiries/data/datasource/inquiry_remote_datasource_imp.dart';
import 'package:diagnosis_project/Feature/Inquiries/data/repository/inquiry_repository_impl.dart';
import 'package:diagnosis_project/Feature/Inquiries/domain/usecases/get_inquiry_details_usecase.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/PrimaryButton.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/gradinetCard.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

Future<void> dialogProgress(
  BuildContext context, {
  required int inquiryId,
}) {
  return showDialog(
    context: context,
    builder: (dialogContext) {
      final dio = Dio();
      final apiConsumer = DioConsumer(dio: dio);

      final inquiryRemoteDataSource = InquiryRemoteDataSourceImpl(apiConsumer);

      final inquiryRepository = InquiryRepositoryImpl(
          inquiryRemoteDataSource: inquiryRemoteDataSource);

      final getInquiryDetailsUseCase =
          GetInquiryDetailsUseCase(inquiryRepository);

      return BlocProvider(
        create: (_) => InquiryDetailsCubit(
            getInquiryDetailsUseCase: getInquiryDetailsUseCase)
          ..getInquiryDetails(inquiryId: inquiryId),
        child: AlertDialog(
          backgroundColor: Colors.white,
          content: BlocBuilder<InquiryDetailsCubit, InquiryDetailsState>(
            builder: (context, state) {
              if (state is InquiryDetailsLoading) {
                return const SizedBox(
                  height: 150,
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (state is InquiryDetailsError) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(state.error),
                    const SizedBox(height: 16),
                    PrimaryButton(
                      text: "Close",
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                );
              }
              if (state is InquiryDetailsSuccess) {
                final inquiry = state.inquiryDetails;
                final formatted = DateFormat('MMMM d, y').format(inquiry.date);

                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title + Status
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            inquiry.symptoms ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Color(0xff505050),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xffF3D39C),
                            ),
                            child: Text(
                              inquiry.status ?? '',
                              style: const TextStyle(
                                color: Color(0xffA97007),
                                fontSize: 8,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      /// Ticket + Date
                      Text(
                        '# $inquiryId',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xff565656C2),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.date_range,
                              color: Color(0xff565656C2)),
                          const SizedBox(width: 4),
                          Text(
                            formatted,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xff565656C2),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      gradientCard(
                        child: Text(
                          inquiry.notes ?? '',
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff3562BC),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),
                      const Text("Attachments"),
                      Gap(8.h),
                      Attachmens(
                        files: inquiry.files,
                      ),
                      //   AttachmentBox(),

                      const SizedBox(height: 16),
                      PrimaryButton(
                        text: "OK",
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      );
    },
  );
}

class Attachmens extends StatelessWidget {
  final List<String>? files;

  const Attachmens({super.key, this.files});

  @override
  Widget build(BuildContext context) {
    if (files == null || files!.isEmpty) {
      return const Text(
        'No attachments',
        style: TextStyle(color: Colors.grey),
      );
    }

    return SizedBox(
        height: 90,
        child: DottedBorder(
            options: const RectDottedBorderOptions(
              dashPattern: [15, 5],
              strokeWidth: 2,
              color: AppColors.gray7A,
              padding: EdgeInsets.all(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: files!.map((filePath) {
                final fileName = filePath.split('/').last;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Expanded(
                    child: Text(
                      fileName,
                      style: StyleApp.font12gray7ARegular,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              }).toList(),
            )));
  }
}
