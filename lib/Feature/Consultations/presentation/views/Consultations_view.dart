// import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
// import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/DataTypesList.dart';
// import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/DiagnosisCardDetails.dart';
// import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/DiagnosisCardDetailsl_ist.dart';
// import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/consultations_section.dart';
// import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/custom_appBar_Consultations.dart';
// import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/slider_bar_doctor.dart';
// import 'package:flutter/material.dart';
//
// class ConsultationsView extends StatelessWidget {
//   const ConsultationsView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteBackground,
//       appBar: const PreferredSize(
//           preferredSize: Size.fromHeight(65),
//           child: CustomAppBarConsultations()),
//       drawer: const SliderBarDoctor(),
//       body: SafeArea(
//         child: SingleChildScrollView(
//             child: Column(
//           children: [
//             Container(
//               height: 3,
//               color: Colors.grey[300],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const ConsultationsSection(),
//             const SizedBox(
//               height: 8,
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 28),
//               child: Column(
//                 children: [
//                   DataTypesList(),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   DiagnosiscarddetailslIst(),
//                 ],
//               ),
//             )
//           ],
//         )),
//       ),
//     );
//   }
// }
