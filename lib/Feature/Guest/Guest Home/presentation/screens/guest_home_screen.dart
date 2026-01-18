import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/Theme App/colors.dart';
import '../../../../DashBoard Patient/presention/Widgets/slider_bar.dart';
import '../../../../Doctor/Doctors/presentation/screens/widgets/custom_bottom_nav.dart';
import '../../../../notifications/presentation/views/widgets/custom_appBar.dart';
import 'guest_home_content.dart';

class GuestHomeScreen extends StatefulWidget {
  const GuestHomeScreen({super.key});

  @override
  State<GuestHomeScreen> createState() => _GuestHomeScreenState();
}

class _GuestHomeScreenState extends State<GuestHomeScreen> {
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> pages = const [
    GuestHomeContent(),
    Center(child: Text("Services Screen")),
    Center(child: Text("Doctors Screen")),
    Center(child: Text("Settings Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.whiteBackground,
drawer: const SliderBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.h),
        child: CustomAppBar(
          showMenu: true,
          onMenuTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          showLogo: true,
          logoPath: "assets/image/logo2.png",
          appName: "Diagnosis",
          notificationCount: 5,
        ),
      ),

      body: pages[currentIndex],

      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
