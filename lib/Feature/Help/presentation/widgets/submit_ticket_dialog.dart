import 'package:diagnosis_project/Core/reusable_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../Core/Theme App/colors.dart';
import '../../../../Core/Theme App/Fonts.dart';
import '../../data/cubit/help_cubit.dart';

class SubmitTicketDialog extends StatefulWidget {
  const SubmitTicketDialog({super.key});

  @override
  State<SubmitTicketDialog> createState() => _SubmitTicketDialogState();
}

class _SubmitTicketDialogState extends State<SubmitTicketDialog> {
  final subjectController = TextEditingController();
  final detailsController = TextEditingController();
  @override
  void dispose() {
    subjectController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HelpCubit, HelpState>(
      listener: (context, state) {
        if (state is TicketSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Ticket sent successfully")),
          );

          Navigator.pop(context);
        }
        if (state is HelpError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Dialog(
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
                controller: subjectController,
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
                controller: detailsController,
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
                  child: BlocBuilder<HelpCubit, HelpState>(
                    builder: (context, state) {
                      final isLoading = state is TicketLoading;

                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.BluePrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: isLoading
                            ? null
                            : () {
                                context.read<HelpCubit>().createTicket(
                                      subject: subjectController.text,
                                      details: detailsController.text,
                                    );
                              },
                        child: isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const CustomText(
                                text: "Send",
                                fontSize: 15,
                                color: AppColors.whiteBackground,
                                fontWeight: Fonts.bold,
                              ),
                      );
                    },
                  ),

                  
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
      ),
    );
  }
}
