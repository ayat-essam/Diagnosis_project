import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/consultation_item.dart';
import 'package:flutter/material.dart';

class ConsultationItemsListView extends StatelessWidget {
  const ConsultationItemsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 19),
          child: ConsultationItem(),
        );
      },
    );
  }
}
