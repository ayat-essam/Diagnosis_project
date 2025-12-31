<<<<<<< HEAD
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Theme App/colors.dart';
import '../../../../Core/reusable_widgets/custom_app_bar.dart';
import '../widgets/previous_replies_card.dart';
import '../widgets/submit_inquiries_card.dart';
import '../widgets/support_info_section.dart';
import '../widgets/track_status_card.dart';

class ComplaintsScreen extends StatefulWidget {
  const ComplaintsScreen({super.key});

  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  File? selectedFile;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'pdf'],
    );

    if (result != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: Column(
        children: [

          const CustomAppBar(title: "Good morning Ahmed",),

          const ComplaintsCustomAppBar(
            title: "Good morning Ahmed",
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SupportInfoSection(),
                  SizedBox(height: 20.h),
                  SubmitInquiriesCard(
                    selectedFile: selectedFile,
                    pickFile: pickFile,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Track Status",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16.sp,
                      height: 1,
                      letterSpacing: 0,
                      color: AppColors.graySecondary,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TrackStatusCard(
                    title: "Appointment was cancelled without notice",
                    status: "In progress",
                    statusColor: const Color(0xFFA97007),
                    ticketNumber: "TKT-2024-1156",
                    date: "Nov 23, 2025",
                    issueType: "Appointment Issue",
                    onViewDetails: () {},
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Previous Replies",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      height: 1,
                      letterSpacing: 0,
                      color: AppColors.graySecondary,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  PreviousRepliesCard(
                    title: "Long wait time at clinic",
                    status: "Replied",
                    statusColor: AppColors.green,
                    ticketNumber: "TKT-2024-1156",
                    date: "Nov 23, 2025",
                    message:
                        "We appreciate your understanding. As a gesture of goodwill, we’d like to offer you priority scheduling for your next appointment.\n\nLast reply: Nov 12, 2025 at 10:00 AM",
                    onViewFullConversation: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
=======
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../Core/Theme App/colors.dart';
// import '../../../../Core/reusable_widgets/custom_app_bar.dart';
// import '../widgets/previous_replies_card.dart';
// import '../widgets/submit_inquiries_card.dart';
// import '../widgets/support_info_section.dart';
// import '../widgets/track_status_card.dart';
//
// class ComplaintsScreen extends StatefulWidget {
//   const ComplaintsScreen({super.key});
//
//   @override
//   State<ComplaintsScreen> createState() => _ComplaintsScreenState();
// }
//
// class _ComplaintsScreenState extends State<ComplaintsScreen> {
//   File? selectedFile;
//
//   Future<void> pickFile() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['jpg', 'png', 'jpeg', 'pdf'],
//     );
//
//     if (result != null) {
//       setState(() {
//         selectedFile = File(result.files.single.path!);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteBackground,
//       body: Column(
//         children: [
// <<<<<<< HEAD
//           const CustomAppBar(title: "Good morning Ahmed",),
// =======
//           const ComplaintsCustomAppBar(
//             title: "Good morning Ahmed",
//           ),
// >>>>>>> Consultations-features
//           Expanded(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.all(16.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SupportInfoSection(),
//                   SizedBox(height: 20.h),
//                   SubmitInquiriesCard(
//                     selectedFile: selectedFile,
//                     pickFile: pickFile,
//                   ),
//                   SizedBox(height: 20.h),
//                   Text(
//                     "Track Status",
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 16.sp,
//                       height: 1,
//                       letterSpacing: 0,
//                       color: AppColors.graySecondary,
//                     ),
//                   ),
//                   SizedBox(height: 10.h),
//                   TrackStatusCard(
//                     title: "Appointment was cancelled without notice",
//                     status: "In progress",
//                     statusColor: const Color(0xFFA97007),
//                     ticketNumber: "TKT-2024-1156",
//                     date: "Nov 23, 2025",
//                     issueType: "Appointment Issue",
//                     onViewDetails: () {},
//                   ),
//                   SizedBox(height: 20.h),
//                   Text(
//                     "Previous Replies",
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16.sp,
//                       height: 1,
//                       letterSpacing: 0,
//                       color: AppColors.graySecondary,
//                     ),
//                   ),
//                   SizedBox(height: 10.h),
//                   PreviousRepliesCard(
//                     title: "Long wait time at clinic",
//                     status: "Replied",
//                     statusColor: AppColors.green,
//                     ticketNumber: "TKT-2024-1156",
//                     date: "Nov 23, 2025",
//                     message:
//                         "We appreciate your understanding. As a gesture of goodwill, we’d like to offer you priority scheduling for your next appointment.\n\nLast reply: Nov 12, 2025 at 10:00 AM",
//                     onViewFullConversation: () {},
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
>>>>>>> 64181c1b4f1e9b40a6758fb23fc7ef82b03cf004
