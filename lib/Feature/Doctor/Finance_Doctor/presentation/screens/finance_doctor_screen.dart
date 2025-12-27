import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Doctor/Finance_Doctor/presentation/widgets/earning_card_wigdet.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/reusable_widgets/custom_app_bar.dart';
import '../widgets/finance_chart_widget.dart';
import '../widgets/finance_hider_widget.dart';

class FinanceDoctorScreen extends StatefulWidget {
  const FinanceDoctorScreen({super.key});

  @override
  State<FinanceDoctorScreen> createState() => _FinanceDoctorScreenState();
}

class _FinanceDoctorScreenState extends State<FinanceDoctorScreen> {
  @override
  Widget build(BuildContext context) {
// <<<<<<< HEAD
    return  const Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomAppBar(title: "Good morning Dr.Ahmed",),
            FinanceHeader(),
            Gap(16),
            EarningCardWidget(),
            Gap(16),
            TransactionBarChartWidget(),
          ],
        ),
      )

    );
// =======
//     return const Scaffold(
//         backgroundColor: AppColors.whiteBackground,
//         body: SingleChildScrollView(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               ComplaintsCustomAppBar(
//                 title: "Good morning Dr.Ahmed",
//               ),
//               FinanceHeader(),
//               Gap(16),
//               EarningCardWidget(),
//               Gap(16),
//               TransactionBarChartWidget(),
//             ],
//           ),
//         ));
// >>>>>>> Consultations-features
  }
}
