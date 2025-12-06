import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../Core/Theme App/styleApp.dart';
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
                  Image.asset('assets/image/logo.png'),
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
        iconPath: "assets/image SVG/dashBoardIcon.svg",
        routeName: '/dashboard',
      ),
      MenuItemData(
        title: 'Diagnosis Module',
        iconPath: "assets/image SVG/DiagnosisModuleIcon.svg",
        routeName: '/diagnosis-module',
      ),
      MenuItemData(
        title: 'Ai Diagnosis Result',
        iconPath: "assets/image SVG/aiMessage.svg",
        routeName: '/ai-diagnosis-result',
      ),
      MenuItemData(
        title: 'Drug Checker',
        iconPath: "assets/image SVG/Vector.svg",
        routeName: '/drug-checker',
      ),
      MenuItemData(
        title: 'Physiotherapy',
        iconPath: "assets/image SVG/Physiotherapy.svg",
        routeName: '/physiotherapy',
      ),
      MenuItemData(
        title: 'Inquiries',
        iconPath: "assets/image SVG/Inquiries.svg",
        routeName: '/inquiries',
      ),
      MenuItemData(
        title: 'Complaints',
        iconPath: "assets/image SVG/Diagnosis.svg",
        routeName: '/complaints',
      ),
      MenuItemData(
        title: 'Directory',
        iconPath: "assets/image SVG/DirectoryIcon.svg",
        routeName: '/directory',
      ),
      MenuItemData(
        title: 'Appointments',
        iconPath: "assets/image SVG/opppointIcon.svg",
        routeName: '/appointments',
      ),
      MenuItemData(
        title: 'Medical Files',
        iconPath: "assets/image SVG/Medical FilesIcon.svg",
        routeName: '/medical-files',
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

          if (item.routeName != null) {
            Navigator.pushNamed(context, item.routeName!);
          }
        },
      );
    }).toList();
  }

  List<Widget> buildGeneralItems() {
    final generalItems = [
      MenuItemData(
        title: 'Settings',
        iconPath: "assets/image SVG/settingIcon.svg",
        routeName: '/settings',
      ),
      MenuItemData(
        title: 'Help',
        iconPath: "assets/image SVG/helpIcon.svg",
        routeName: '/help',
      ),
      MenuItemData(
        title: 'Log Out',
        iconPath: 'assets/image SVG/logOutIcon.svg',
        routeName: null,
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
          }
          else if (item.routeName != null) {
            Navigator.pushNamed(context, item.routeName!);
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