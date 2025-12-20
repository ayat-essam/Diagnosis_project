import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
//import 'package:diagnosis_project/Feature/Complaints/Complaints_Screen.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/Widgets/patient_dash_board_appbar.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/patient_dashboard.dart';
import 'package:diagnosis_project/Feature/Diagnosis%20Module/Presentation/screens/Diagnosis_Module_Screen.dart';
import 'package:diagnosis_project/Feature/Doctor/Appointments/Presention/pages/appointments_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../Core/Theme App/styleApp.dart';
import '../../../Help/presentation/screens/Help_Screen.dart';
import 'drawer_item.dart';
import 'menu_Item.dart';

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
      MenuItemData(
        title: 'DashBoard',
        iconPath: "assets/image_SVG/dashBoardIcon.svg",
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PatientDashboard(),
              ));
        },
      ),
      MenuItemData(
        title: 'Diagnosis Module',
        iconPath: "assets/image_SVG/DiagnosisModuleIcon.svg",
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const DiagnosisModuleScreen(),
              ));
        },
      ),
      MenuItemData(
        title: 'Ai Diagnosis Result',
        iconPath: "assets/image_SVG/aiMessage.svg",
        onTap: () {},
      ),
      MenuItemData(
        title: 'Drug Checker',
        iconPath: "assets/image_SVG/Vector.svg",
        onTap: () {},
      ),
      MenuItemData(
        title: 'Physiotherapy',
        iconPath: "assets/image_SVG/Physiotherapy.svg",
        onTap: () {},
      ),
      MenuItemData(
        title: 'Inquiries',
        iconPath: "assets/image_SVG/Inquiries.svg",
        onTap: () {},
      ),
      MenuItemData(
        title: 'Complaints',
        iconPath: "assets/image_SVG/Diagnosis.svg",
        onTap: () {
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => ComplaintsScreen(),
          //     ));
        },
      ),
      MenuItemData(
        title: 'Directory',
        iconPath: "assets/image_SVG/DirectoryIcon.svg",
        onTap: () {},
      ),
      MenuItemData(
        title: 'Appointments',
        iconPath: "assets/image_SVG/opppointIcon.svg",
        onTap: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Appointments(),
              ));
        },
      ),
      MenuItemData(
        title: 'Medical Files',
        iconPath: "assets/image_SVG/Medical FilesIcon.svg",
        onTap: () {},
      ),
    ];

    return menuItems.map<Widget>((item) {
      return DrawerItem(
        title: item.title,
        iconPath: item.iconPath,
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
      MenuItemData(
        title: 'Settings',
        iconPath: "assets/image_SVG/settingIcon.svg",
        onTap: () {},
      ),
      MenuItemData(
        title: 'Help',
        iconPath: "assets/image_SVG/helpIcon.svg",
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HelpScreen(),
            ),
          );
        },
      ),
      MenuItemData(
        title: 'Log Out',
        iconPath: 'assets/image_SVG/logOutIcon.svg',
        onTap: () {},
      ),
    ];

    return generalItems.map<Widget>((item) {
      return DrawerItem(
        title: item.title,
        iconPath: item.iconPath,
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
