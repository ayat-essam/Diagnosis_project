import 'package:flutter/material.dart';
import '../../../../Core/Theme App/Fonts.dart';
import '../../../../Core/Theme App/colors.dart';
import '../../Data/faq_data.dart';

class FaqExpansionList extends StatefulWidget {
  const FaqExpansionList({super.key});

  @override
  State<FaqExpansionList> createState() => _FaqExpansionListState();
}

class _FaqExpansionListState extends State<FaqExpansionList> {
  int? expandedId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: faqs.map((faq) {
        final isExpanded = faq.id == expandedId;

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
                    expandedId = isExpanded ? null : faq.id;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                    ],
                  ),
                ),
              ),
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: const BoxDecoration(
                      // border: Border(
                      //   top: BorderSide(color: AppColors.BluePrimary),
                      // ),
                      ),
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
      }).toList(),
    );
  }
}
