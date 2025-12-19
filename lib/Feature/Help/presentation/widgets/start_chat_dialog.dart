import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../Core/Theme App/Fonts.dart';
import '../../../../Core/Theme App/colors.dart';

class StartChatDialog extends StatelessWidget {
  const StartChatDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Support Chat',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: Fonts.bold,
                    color: AppColors.blackSecondary,
                    fontFamily: 'Poppins'
                  ),
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
            const Gap(12),
            // Chat body
            Container(
              height: 200.h,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.BluePrimary),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.BluePrimary.withOpacity(.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Hello! How can I assist you today?',
                      style: TextStyle(
                        color: AppColors.graySecondary,
                        fontFamily: 'Poppins',
                        fontWeight: Fonts.medium,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(

                          decoration: InputDecoration(
                            hintText: 'Type your message...',
                            hintStyle: const TextStyle(
                              color: AppColors.graySecondary,
                              fontFamily: 'Poppins',
                              fontWeight: Fonts.medium,
                              fontSize: 14,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      const Gap(8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.BluePrimary,
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Send',
                          style: TextStyle(
                            color: AppColors.whiteBackground,
                            fontFamily: 'Poppins',
                            fontWeight: Fonts.medium,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
