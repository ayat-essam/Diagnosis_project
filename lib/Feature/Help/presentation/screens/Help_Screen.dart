import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Theme App/colors.dart';
import '../../../../Core/reusable_widgets/custom_app_bar.dart';
import '../../../DashBoard/presention/Widgets/slider_bar.dart';
import '../../../../Core/reusable_widgets/search_bar_widget.dart';
import '../widgets/contact_support_item.dart';
import '../widgets/faqItem.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      key: _scaffoldKey,
      drawer: const SliderBar(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
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
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBarWidget(hintText: 'Search...',),
              FaqExpansionList(),
              ContactSupportItem(),

            ],
          ),
        ),
      ),
    );
  }
}
