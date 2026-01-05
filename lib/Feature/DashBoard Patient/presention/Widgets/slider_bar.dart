import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Inquiries/Inquiries_Screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../Core/Theme App/styleApp.dart';
import '../../../Diagnosis Module/Presentation/screens/Diagnosis_Module_Screen.dart';
import '../patient_dashboard.dart';
import 'drawer_item.dart';
import 'menu_item_patient.dart';

class SliderBar extends StatefulWidget {
  const SliderBar({super.key});

  @override
  State<SliderBar> createState() => _SliderBarState();
}

class _SliderBarState extends State<SliderBar> {
  String? selectedMenuItem;
  String? selectedGeneralItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.whiteBackground,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      Image.asset('assets/image/logo2.png'),
                      const Text("Diagnosis",style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.BluePrimary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      ),)
                    ],
                  ),
                ],
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MENU',
                    style: StyleApp.font14GrayMedium.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(10),
                  ...buildMenuItems(),
                ],
              ),
            ),
            const Divider(height: 30, thickness: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'GENERAL',
                    style: StyleApp.font14BlueSemiBold.copyWith(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(10),
                  ...buildGeneralItems(),
                ],
              ),
            ),
            const Gap(10),
          ],
        ),
      ),
    );
  }

  List<Widget> buildMenuItems() {
    final menuItems = [
      MenuItemPatients(
        title: 'DashBoard',
// <<<<<<< HEAD:lib/Feature/DashBoard Patient/presention/Widgets/slider_bar.dart
        ImagePath: "assets/image_SVG/dashBoardIcon.svg",
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PatientDashboard(),
              ));
        },
// =======
//         iconPath: "assets/image_SVG/dashBoardIcon.svg",
//         onTap: () {},
// >>>>>>> Consultations-features:lib/Feature/DashBoard/presention/Widgets/slider_bar.dart
      ),
      MenuItemPatients(
        title: 'Diagnosis Module',
// <<<<<<< HEAD:lib/Feature/DashBoard Patient/presention/Widgets/slider_bar.dart
        ImagePath: "assets/image_SVG/DiagnosisModuleIcon.svg",
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DiagnosisModuleScreen(),
              ));
        },
// =======
//         iconPath: "assets/image_SVG/DiagnosisModuleIcon.svg",
//         onTap: () {},
// >>>>>>> Consultations-features:lib/Feature/DashBoard/presention/Widgets/slider_bar.dart
      ),
      MenuItemPatients(
        title: 'Ai Diagnosis Result',
// <<<<<<< HEAD:lib/Feature/DashBoard Patient/presention/Widgets/slider_bar.dart
        ImagePath: "assets/image_SVG/aiMessage.svg",
// =======
//         iconPath: "assets/image_SVG/aiMessage.svg",
// >>>>>>> Consultations-features:lib/Feature/DashBoard/presention/Widgets/slider_bar.dart
        onTap: () {},
      ),
      MenuItemPatients(
        title: 'Drug Checker',
// <<<<<<< HEAD:lib/Feature/DashBoard Patient/presention/Widgets/slider_bar.dart
        ImagePath: "assets/image_SVG/Vector.svg",
// =======
//         iconPath: "assets/image_SVG/Vector.svg",
// >>>>>>> Consultations-features:lib/Feature/DashBoard/presention/Widgets/slider_bar.dart
        onTap: () {},
      ),
      MenuItemPatients(
        title: 'Physiotherapy',
// <<<<<<< HEAD:lib/Feature/DashBoard Patient/presention/Widgets/slider_bar.dart
        ImagePath: "assets/image_SVG/Physiotherapy.svg",
// =======
//         iconPath: "assets/image_SVG/Physiotherapy.svg",
// >>>>>>> Consultations-features:lib/Feature/DashBoard/presention/Widgets/slider_bar.dart
        onTap: () {},
      ),
      MenuItemPatients(
        title: 'Inquiries',
// <<<<<<< HEAD:lib/Feature/DashBoard Patient/presention/Widgets/slider_bar.dart
        ImagePath: "assets/image_SVG/Inquiries.svg",
// =======
//         iconPath: "assets/image_SVG/Inquiries.svg",
// >>>>>>> Consultations-features:lib/Feature/DashBoard/presention/Widgets/slider_bar.dart
        onTap: () {},
      ),
      MenuItemPatients(
        title: 'Complaints',
        ImagePath: "assets/image_SVG/Diagnosis.svg",
        onTap: () {
// <<<<<<< HEAD:lib/Feature/DashBoard Patient/presention/Widgets/slider_bar.dart
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => ComplaintsScreen(),
          //     ));
// =======
//           Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ComplaintsScreen(),
//               ));
// >>>>>>> Consultations-features:lib/Feature/DashBoard/presention/Widgets/slider_bar.dart
        },
      ),
      MenuItemPatients(
        title: 'Directory',
// <<<<<<< HEAD:lib/Feature/DashBoard Patient/presention/Widgets/slider_bar.dart
        ImagePath: "assets/image_SVG/DirectoryIcon.svg",
        onTap: () {},
      ),

      MenuItemPatients(
        title: 'Medical Files',
        ImagePath: "assets/image_SVG/Medical FilesIcon.svg",
// =======
//         iconPath: "assets/image_SVG/DirectoryIcon.svg",
//         onTap: () {},
//       ),
//       MenuItemData(
//         title: 'Appointments',
//         iconPath: "assets/image_SVG/opppointIcon.svg",
//         onTap: () {
//           Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Appointments(),
//               ));
//         },
//       ),
//       MenuItemData(
//         title: 'Medical Files',
//         iconPath: "assets/image_SVG/Medical FilesIcon.svg",
// >>>>>>> Consultations-features:lib/Feature/DashBoard/presention/Widgets/slider_bar.dart
        onTap: () {},
      ),
    ];

    return menuItems.map<Widget>((item) {
      return DrawerItem(
        title: item.title,
        iconPath: item.ImagePath,
        isActive: selectedMenuItem == item.title,
        onTap: () {
          setState(() {
            selectedMenuItem = item.title;
          });

          Navigator.pop(context);
          item.onTap?.call();
          // if (item.onTap != null) {
          //   Navigator.pushNamed(context, item.onTap as String);
          // }
        },
      );
    }).toList();
  }

  List<Widget> buildGeneralItems() {
    final generalItems = [
      MenuItemPatients(
        title: 'Settings',
// <<<<<<< HEAD:lib/Feature/DashBoard Patient/presention/Widgets/slider_bar.dart
        ImagePath: "assets/image_SVG/settingIcon.svg",
// =======
//         iconPath: "assets/image_SVG/settingIcon.svg",
// >>>>>>> Consultations-features:lib/Feature/DashBoard/presention/Widgets/slider_bar.dart
        onTap: () {},
      ),
      MenuItemPatients(
        title: 'Help',
// <<<<<<< HEAD:lib/Feature/DashBoard Patient/presention/Widgets/slider_bar.dart
        ImagePath: "assets/image_SVG/helpIcon.svg",
// =======
//         iconPath: "assets/image_SVG/helpIcon.svg",
// >>>>>>> Consultations-features:lib/Feature/DashBoard/presention/Widgets/slider_bar.dart
        onTap: () {},
      ),
      MenuItemPatients(
        title: 'Log Out',
// <<<<<<< HEAD:lib/Feature/DashBoard Patient/presention/Widgets/slider_bar.dart
        ImagePath: 'assets/image_SVG/logOutIcon.svg',
// =======
//         iconPath: 'assets/image_SVG/logOutIcon.svg',
// >>>>>>> Consultations-features:lib/Feature/DashBoard/presention/Widgets/slider_bar.dart
        onTap: () {},
      ),
    ];

    return generalItems.map<Widget>((item) {
      return DrawerItem(
        title: item.title,
        iconPath: item.ImagePath,
        isActive: selectedGeneralItem == item.title,
        onTap: () {
          setState(() {
            selectedGeneralItem = item.title;
          });
          Navigator.pop(context);
          if (item.title == 'Log Out') {
            handleLogout(context);
          } else if (item.onTap != null) {
            Navigator.pushNamed(context, item.onTap as String);
          }
        },
      );
    }).toList();
  }

  void handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('LogOut'),
        content: const Text('Are You Sure you want Exit ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);

              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
            child: const Text('Log Out', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
