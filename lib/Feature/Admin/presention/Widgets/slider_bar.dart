import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/drawer_item_admin.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../Core/Theme App/styleApp.dart';
import '../../../DashBoard/presention/Widgets/drawer_item.dart';
import '../../../DashBoard/presention/Widgets/menu_Item.dart';


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

        },
      ),
      MenuItemData(
        title: 'Doctors\n Management',
        iconPath: "assets/image_SVG/doctorMangementIcon.svg",
        onTap: () {

        },
      ),
      MenuItemData(
        title: 'Patients\n Management',
        iconPath: "assets/image_SVG/patientsMangmentsIcon.svg",
        onTap: () {},
      ),
      MenuItemData(
        title: 'System\n Settings',
        iconPath: "assets/image_SVG/systemSettingIcon.svg",
        onTap: () {},
      ),
    ];

    return menuItems.map<Widget>((item) {
      return DrawerItemAdmin(
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
