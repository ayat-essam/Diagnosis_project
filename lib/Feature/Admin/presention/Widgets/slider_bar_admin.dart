import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/screens/admin_setting_screen.dart';
import 'package:diagnosis_project/Feature/Admin/Admin_dashBoard/presentation/screens/admin_dashboard_screen.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/doctors_mangement_screen.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/drawer_item_admin.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../Core/Theme App/styleApp.dart';

import 'menu_Item_admin.dart';

class SliderBarAdmin extends StatefulWidget {
  const SliderBarAdmin({super.key});

  @override
  State<SliderBarAdmin> createState() => _SliderBarAdminState();
}

class _SliderBarAdminState extends State<SliderBarAdmin> {
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
                      Image.asset(
                        'assets/image/logo2.png',
                        width: 80,
                        fit: BoxFit.fitWidth,
                      ),
                      const Text(
                        "Diagnosis",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: AppColors.BluePrimary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 10, thickness: 1),
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
      MenuItemDataAdmin(
        title: 'DashBoard',
        imagePath: "assets/image_SVG/dashBoardIcon.svg",
        imageColor: AppColors.gray,
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const AdminDashboardScreen();
          }));
        },
      ),
      MenuItemDataAdmin(
        title: 'Doctors\n Management',
        imagePath: "assets/image_SVG/doctorMangementIcon.svg",
        imageColor: AppColors.gray,
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const DoctorsMangementScreen();
          }));
        },
      ),
      MenuItemDataAdmin(
        title: 'Patients\n Management',
        imagePath: "assets/image_SVG/patientsMangmentsIcon.svg",
        imageColor: AppColors.gray,
        onTap: () {},
      ),
      MenuItemDataAdmin(
        title: 'System\n Settings',
        imagePath: "assets/image_SVG/systemSettingIcon.svg",
        imageColor: AppColors.gray,
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const AdminSettingScreen();
          }));
        },
      ),
    ];

    return menuItems.map<Widget>((item) {
      return DrawerItemAdmin(
        title: item.title,
        imagePath: item.imagePath,
        isActive: selectedMenuItem == item.title,
        onTap: () {
          setState(() {
            selectedMenuItem = item.title;
          });

          Navigator.pop(context);
          item.onTap?.call();
        },
      );
    }).toList();
  }

  List<Widget> buildGeneralItems() {
    final generalItems = [
      MenuItemDataAdmin(
        title: 'Settings',
        imagePath: "assets/image_SVG/settingIcon.svg",
        onTap: () {},
        imageColor: AppColors.gray,
      ),
      MenuItemDataAdmin(
        title: "LogOut",
        imagePath: 'assets/image_SVG/logOutIcon.svg',
        imageColor: AppColors.RedError,
        onTap: () {},
      ),
    ];

    return generalItems.map<Widget>((item) {
      return DrawerItemAdmin(
        title: item.title,
        imagePath: item.imagePath,
        isActive: selectedGeneralItem == item.title,
        onTap: () {
          setState(() {
            selectedGeneralItem = item.title;
          });
          Navigator.pop(context);
          if (item.title == 'Log Out') {
            handleLogout(context);
          } else if (item.onTap != null) {
            item.onTap?.call();
            // Navigator.pushNamed(context, item.onTap as String);
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
            child: const Text('LogOut', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
