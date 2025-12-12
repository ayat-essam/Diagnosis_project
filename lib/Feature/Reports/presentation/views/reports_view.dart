import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Reports/presentation/views/widgets/custom_appBar_reports.dart';
import 'package:diagnosis_project/Feature/Reports/presentation/views/widgets/custom_search.dart';
import 'package:flutter/material.dart';

class ReportsView extends StatelessWidget {
  const ReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(65), child: CustomAppBarReports()),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 3,
                color: Colors.grey[300],
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Services",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff252525),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomSearch(),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
