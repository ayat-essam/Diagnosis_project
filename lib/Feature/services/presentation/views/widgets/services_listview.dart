import 'package:diagnosis_project/Feature/services/presentation/views/widgets/service_item.dart';
import 'package:flutter/material.dart';

class ServicesListView extends StatelessWidget {
  const ServicesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (context, index) {
          return const ServiceItem();
        },
      ),
    );
  }
}
