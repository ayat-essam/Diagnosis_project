import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Feature/Directory/presentation/screens/widgets/filter_option_row.dart';
import 'package:diagnosis_project/Feature/Directory/presentation/screens/widgets/filter_result_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../DashBoard Patient/presention/Widgets/patient_dash_board_appbar.dart';
import '../../../DashBoard Patient/presention/Widgets/slider_bar.dart';
import '../../../Inquiries/data/cubit/create_inquiry_cubit.dart';
import '../../../Inquiries/data/cubit/create_inquiry_state.dart';

class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const PationDashBoardAppbar(),
      ),
      drawer: const SliderBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Directory',
              style: StyleApp.font25grayDarkMedium,
            ),
            Gap(20.h),
            Expanded(
              child: CustomLinearGradiantContainer(
                borderRadius: 8.r,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 28.0,
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: Column(
                    children: [
                      const FilterOption(),
                      Gap(28.h),
                      const Expanded(
                        child: FilterResultList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Gap(10.h),
            Align(
              alignment: Alignment.bottomRight,
              child: BlocConsumer<CreateInquiryCubit, CreateInquiryState>(
                listener: (context, state) {
                  if (state is CreateInquirySuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Inquiry sent successfully')),
                    );
                  }

                  if (state is CreateInquiryError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is CreateInquiryLoading) {
                    return SizedBox(
                      width: 160.w,
                      height: 48.h,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  return CustomAppButton(
                    onTap: () {
                      context.read<CreateInquiryCubit>().submitInquiry();
                    },
                    text: 'Confirm',
                    width: 160.w,
                    borderRedius: 12,
                    verticalPadding: 12,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
