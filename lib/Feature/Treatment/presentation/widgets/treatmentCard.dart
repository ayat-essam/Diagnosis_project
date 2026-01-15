import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:flutter/material.dart';

class Treatmentcard extends StatelessWidget {
  final String titleCard;
  final String contentCard;
  Treatmentcard(this.titleCard, this.contentCard);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: CustomLinearGradiantContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titleCard,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff505050)),
          ),
          Text(
            contentCard ?? "2 Weeks",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          )
        ],
      ),
    ));
  }
}
