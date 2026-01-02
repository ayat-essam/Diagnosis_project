import 'package:diagnosis_project/Core/reusable_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../Core/Theme App/colors.dart';
import '../../../../Core/Theme App/Fonts.dart';

class SubmitTicketDialog extends StatelessWidget {
  const SubmitTicketDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: "Submit Support Ticket",
                  fontSize: 20,
                  color: AppColors.blackSecondary,
                  fontWeight: Fonts.bold,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.close,
                    color: AppColors.RedError,
                  ),
                )
              ],
            ),
            const Gap(16),
            const CustomText(
              text: "Subject",
              fontSize: 15,
              color: AppColors.grayTextChart,
              fontWeight: Fonts.semiBold,
            ),
            const Gap(6),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your subject....",
                hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: Fonts.medium,
                    color: AppColors.graySecondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
            ),
            const Gap(12),
            const CustomText(
              text: "Details",
              fontSize: 15,
              color: AppColors.grayTextChart,
              fontWeight: Fonts.semiBold,
            ),
            const Gap(6),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Enter your details....",
                hintStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: Fonts.medium,
                    color: AppColors.graySecondary),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              ),
            ),
            const Gap(20),
            Center(
              child: SizedBox(
                width: 191,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.BluePrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: const CustomText(
                      text: "Send",
                      fontSize: 15,
                      color: AppColors.whiteBackground,
                      fontWeight: Fonts.bold,
                    )),
              ),
            ),
            const Gap(8),
            Center(
              child: SizedBox(
                width: 191,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.BluePrimary,
                    side: const BorderSide(color: AppColors.BluePrimary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
