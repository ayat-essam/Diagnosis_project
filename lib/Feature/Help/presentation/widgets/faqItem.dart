import 'package:diagnosis_project/Feature/Help/presentation/cubit/help_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/Theme App/Fonts.dart';
import '../../../../Core/Theme App/colors.dart';

class FaqExpansionList extends StatefulWidget {
  const FaqExpansionList({super.key});

  @override
  State<FaqExpansionList> createState() => _FaqExpansionListState();
}

class _FaqExpansionListState extends State<FaqExpansionList> {
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpCubit, HelpState>(
      builder: (context, state) {
        if (state is HelpLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is FaqsLoaded) {
          final faqs = state.faqs;

          return Column(
            children: List.generate(faqs.length, (index) {
              final faq = faqs[index];
              final isExpanded = expandedIndex == index;

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.BluePrimary),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          expandedIndex = isExpanded ? null : index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                faq.question,
                                style: const TextStyle(
                                  color: AppColors.graySecondary,
                                   fontFamily: 'Poppins',
                                  fontWeight: Fonts.semiBold,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Transform.rotate(
                              angle: isExpanded ? 3.14 / 2 : 0,
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: AppColors.BluePrimary,
                              ),
                            ),
                            Icon(
                              isExpanded
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isExpanded)
                      AnimatedCrossFade(
                        firstChild: const SizedBox.shrink(),
                        secondChild: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Text(
                            faq.answer,
                            style: const TextStyle(
                              color: AppColors.graySecondary,
                              fontFamily: 'Poppins',
                              fontWeight: Fonts.regular,
                              fontSize: 11,
                            ),
                          ),
                        ),
                        crossFadeState: isExpanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 250),
                      ),
                  ],
                ),
              );
            }),
          );
        }

        if (state is HelpError) {
          return Text(state.message);
        }

        return const SizedBox.shrink();
      },
    );
  }
}

