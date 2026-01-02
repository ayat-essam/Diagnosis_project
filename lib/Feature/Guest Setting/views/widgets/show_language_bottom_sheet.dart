import 'package:diagnosis_project/Core/localization/cubit/locale_cubit.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:diagnosis_project/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.BluePrimary),
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              children: [
                Text(
                  S.of(context).language,
                  style: const TextStyle(
                    color: Color(0xff1B1B1B),
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset('assets/image/dashicons_no.png'),
                ),
              ],
            ),

            const SizedBox(height: 20),
            BlocBuilder<LocaleCubit, LocaleState>(
              builder: (context, state) {
                final currentLocale =
                    state is LocaleChanged ? state.locale.languageCode : 'en';
                return Column(
                  children: [
                    _languageItem(
                      title: S.of(context).language_english,
                      isSelected: currentLocale == 'en',
                      onTap: () {
                        context.read<LocaleCubit>().changeToEnglish();
                      },
                    ),
                    const SizedBox(height: 12),
                    _languageItem(
                      title: S.of(context).language_arabic,
                      isSelected: currentLocale == 'ar',
                      onTap: () {
                        context.read<LocaleCubit>().changeToArabic();
                      },
                    )
                  ],
                );
              },
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.BluePrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  S.of(context).Update_language,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _languageItem({
  required String title,
  required bool isSelected,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Poppins',
            color: isSelected ? AppColors.BluePrimary : const Color(0xff1B1B1B),
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
        const Spacer(),
        if (isSelected) Image.asset('assets/image/correct.png'),
      ],
    ),
  );
}
