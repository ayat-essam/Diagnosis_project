<<<<<<< HEAD
// import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
// import 'package:diagnosis_project/Feature/services/presentation/views/widgets/custom_appBar_services.dart';
// import 'package:diagnosis_project/Feature/services/presentation/views/widgets/services_listview.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ServicesScreen extends StatelessWidget {
//   const ServicesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.whiteBackground,
//       body: SafeArea(
//         child: Column(
//           children: [
//             const CustomAppBarServices(),
//             Container(
//               height: 3,
//               color: Colors.grey[300],
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 14.w,
//                 ),
//                 const Icon(Icons.arrow_back_ios,
//                     size: 25, color: Color(0xff231F20)),
//                 const SizedBox(width: 20),
//                 const Text(
//                   "Services",
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xff252525),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             const ServicesListView()
//           ],
//         ),
//       ),
//     );
//   }
// }
=======
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/services/presentation/views/widgets/custom_appBar_services.dart';
import 'package:diagnosis_project/Feature/services/presentation/views/widgets/services_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBarServices(),
            Container(
              height: 3,
              color: Colors.grey[300],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                SizedBox(
                  width: 14.w,
                ),
                const Icon(Icons.arrow_back_ios,
                    size: 25, color: Color(0xff231F20)),
                const SizedBox(width: 20),
                const Text(
                  "Services",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff252525),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const ServicesListView()
          ],
        ),
      ),
    );
  }
}
>>>>>>> services-features
