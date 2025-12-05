import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../Core/Theme App/styleApp.dart';
import 'drawer_item.dart';

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
              padding: const EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/image/logo.png'),
                ],
              ),
            ),
            const Gap(40),

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
                  const Gap(15),
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
                  const Gap(15),
                  ..._buildGeneralItems(),
                ],
              ),
            ),

            const Gap(30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.logout, size: 20),
                label: Text(
                  'Logout',
                  style: StyleApp.font16BlackRegular.copyWith(
                      fontWeight: FontWeight.w700, color: AppColors.RedError),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.withOpacity(0.1),
                  foregroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const Gap(20),
          ],
        ),
      ),
    );
  }

  List<Widget> buildMenuItems() {
    final menuItems = [
      MenuItemData(title: 'DashBoard', iconPath: "assets/image SVG/dashBoardIcon.svg"),
      MenuItemData(title: 'Diagnosis Module', iconPath: "assets/image SVG/DiagnosisModuleIcon.svg"),
      MenuItemData(title: 'Ai Diagnosis Result', iconPath: "assets/image SVG/aiMessage.svg"),
      MenuItemData(title: 'Drug Checker', iconPath: "assets/image SVG/Vector.svg"),
      MenuItemData(title: 'Physiotherapy', iconPath: "assets/image SVG/Physiotherapy.svg"),
      MenuItemData(title: 'Inquiries', iconPath: "assets/image SVG/Inquiries.svg"),
      MenuItemData(title: 'Complaints', iconPath: "assets/image SVG/Diagnosis.svg"),
      MenuItemData(title: 'Directory', iconPath: "assets/image SVG/DirectoryIcon.svg"),
      MenuItemData(title: 'Appointments', iconPath: "assets/image SVG/opppointIcon.svg"),
      MenuItemData(title: 'Medical Files', iconPath: "assets/image SVG/Medical FilesIcon.svg"),
    ];

    return menuItems.map((item) {
      return DrawerItem(
        title: item.title,
        iconPath: item.iconPath,
        isActive: selectedMenuItem == item.title,
        onTap: () {
          setState(() {
            selectedMenuItem = item.title;
          });
          print('Selected: ${item.title}');
        },
      );
    }).toList();
  }

  List<Widget> _buildGeneralItems() {
    final generalItems = [
      MenuItemData(title: 'Settings', iconPath: "assets/image SVG/settingIcon.svg"),
      MenuItemData(title: 'Help', iconPath: "assets/image SVG/helpIcon.svg"),
    ];

    return generalItems.map((item) {
      return DrawerItem(
        title: item.title,
        iconPath: item.iconPath,
        isActive: selectedGeneralItem == item.title,
        onTap: () {
          setState(() {
            selectedGeneralItem = item.title;
          });
          print('Selected: ${item.title}');
        },
      );
    }).toList();
  }
}

class MenuItemData {
  final String title;
  final String iconPath;

  MenuItemData({
    required this.title,
    required this.iconPath,
  });
}