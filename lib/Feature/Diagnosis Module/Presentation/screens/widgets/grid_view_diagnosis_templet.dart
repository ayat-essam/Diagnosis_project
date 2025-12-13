import 'package:diagnosis_project/Feature/Diagnosis%20Module/Presentation/screens/widgets/diagnosis_templet_container.dart';
import 'package:diagnosis_project/Feature/Diagnosis%20Module/data/models/diagnosis_templates_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewDiagnosisTemplet extends StatelessWidget {
  const GridViewDiagnosisTemplet({super.key});

  @override
  Widget build(BuildContext context) {
    List<DiagnosisTemplatesModel> infoCards = [
      DiagnosisTemplatesModel(
          title: 'Cold & Flu',
          backgroundImageColor: const Color(0xffF6DBDB),
          onTap: () {},
          imgPath: 'assets/image/clod_and_flu.png'),
      DiagnosisTemplatesModel(
          title: 'Stomach Pain',
          backgroundImageColor: const Color(0xff9AFEC8B),
          onTap: () {},
          imgPath: 'assets/image/tdesign_tea.png'),
      DiagnosisTemplatesModel(
          title: 'Hypertension',
          backgroundImageColor: const Color(0xffF6DBDB),
          onTap: () {},
          imgPath: 'assets/image/Hypertension.png'),
      DiagnosisTemplatesModel(
          title: 'Diabetes Follow-up',
          backgroundImageColor: const Color(0xffC6D8FD),
          onTap: () {},
          imgPath: 'assets/image/diabetes_follow_up.png'),
    ];

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final card = infoCards[index];
            return DiagnocsisTempletContainer(
              title: card.title,
              backgroundImageColor: card.backgroundImageColor,
              imgPath: card.imgPath,
            );
          },
          childCount: infoCards.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
      ),
    );
  }
}
