import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Diagnosis%20Module/Presentation/screens/Diagnosis_Module_Screen.dart';
import 'package:diagnosis_project/Feature/Doctor/My%20Patient/Presention/my_patient_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../../Core/Theme App/styleApp.dart';
import '../../../../../DashBoard Patient/presention/Widgets/drawer_item.dart';
import 'menu_Item_doctors.dart';


class SliderBarDoctor extends StatefulWidget {
  const SliderBarDoctor({super.key});

  @override
  State<SliderBarDoctor> createState() => _SliderBarDoctorState();
}

class _SliderBarDoctorState extends State<SliderBarDoctor> {
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
      MenuItemDoctors(
        title: 'DashBoard',
        ImagePath: "assets/image_SVG/dashBoardIcon.svg",
        onTap: () {},
      ),
      MenuItemDoctors(
        title: 'My Patients',
        ImagePath: "assets/image_SVG/myPatientIcon.svg",
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MyPatientsScreen(),));
        },
      ),
      MenuItemDoctors(
        title: 'Consultations',
        ImagePath: "assets/image_SVG/consultaionIcon.svg",
        onTap: () {

        },
      ),
      MenuItemDoctors(
        title: 'Diagnoses',
        ImagePath: "assets/image_SVG/DiagnosisIcon.svg",
        onTap: () {},
      ),

      MenuItemDoctors(
        title: 'Finance',
        ImagePath: "assets/image_SVG/financeIcon.svg",
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
      MenuItemDoctors(
        title: 'Settings',
        ImagePath: "assets/image_SVG/settingIcon.svg",
        onTap: () {},
      ),
      MenuItemDoctors(
        title: 'Help',
        ImagePath: "assets/image_SVG/helpIcon.svg",
        onTap: () {},
      ),
      MenuItemDoctors(
        title: 'Log Out',
        ImagePath: 'assets/image_SVG/logOutIcon.svg',
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
