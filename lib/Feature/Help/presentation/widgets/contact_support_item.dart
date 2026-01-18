import 'package:diagnosis_project/Feature/Help/presentation/widgets/start_chat_dialog.dart';
import 'package:diagnosis_project/Feature/Help/presentation/widgets/submit_ticket_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/Theme App/Fonts.dart';
import '../../../../Core/Theme App/colors.dart';
import '../../data/cubit/help_cubit.dart';

class ContactSupportItem extends StatelessWidget {
  const ContactSupportItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Contact Support",
            style: TextStyle(
                fontSize: 16,
                fontWeight: Fonts.semiBold,
                color: AppColors.graySecondary,
                fontFamily: 'Poppins'),
          ),
          const SizedBox(height: 6),
          const Text(
            "Send us a ticket or start a live chat",
            style: TextStyle(
                fontSize: 14,
                fontWeight: Fonts.medium,
                color: AppColors.graySecondary,
                fontFamily: 'Poppins'),
          ),
          const SizedBox(height: 16),
    SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.BluePrimary,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (_) => const StartChatDialog(),
                );
              },
              child: const Text(
                "Start chat",
                style: TextStyle(
                  color: AppColors.whiteBackground,
                  fontFamily: 'Poppins',
                  fontWeight: Fonts.medium,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // SizedBox(
          //   width: double.infinity,
          //  child:  ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: AppColors.BluePrimary,
          //     ),
          //     onPressed: () {
          //       showDialog(
          //         context: context,
          //         barrierDismissible: true,
          //         builder: (_) => const StartChatDialog(),
          //       );
          //     },
          //     child: const Text(
          //       "Start chat",
          //       style: TextStyle(
          //         color: AppColors.whiteBackground,
          //         fontFamily: 'Poppins',
          //         fontWeight: Fonts.medium,
          //         fontSize: 14,
          //       ),
          //     ),
          //   ),
          //
          // ),
          // const SizedBox(height: 8),
        SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.BluePrimary),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (dialogContext) {
                      return BlocProvider.value(
                        value: context.read<HelpCubit>(),
                        child: const SubmitTicketDialog(),
                      );
                    },
                  );
                },
                child: const Text(
                  "Submit a ticket",
                  style: TextStyle(
                    color: AppColors.BluePrimary,
                    fontWeight: Fonts.medium,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
