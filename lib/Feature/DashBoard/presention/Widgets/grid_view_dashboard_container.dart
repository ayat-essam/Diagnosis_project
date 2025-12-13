import 'package:diagnosis_project/Feature/DashBoard/data/models/info_container_model.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/Widgets/info_container.dart';
import 'package:flutter/material.dart';

class GridViewDashboardContainer extends StatefulWidget {
  const GridViewDashboardContainer({super.key});

  @override
  State<GridViewDashboardContainer> createState() =>
      _GridViewDashboardContainerState();
}

class _GridViewDashboardContainerState
    extends State<GridViewDashboardContainer> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<InfoContainerModel> infoCards = [
      InfoContainerModel(
        title: 'Next Appointment',
        subtitle: 'Nov 20',
        description: 'Dr. ALI Sameh - 10:00 AM',
        imgPath: 'assets/image/apoinments.png',
        isSelected: false,
      ),
      InfoContainerModel(
          title: 'Drug Checker',
          subtitle: '0 Conflicts',
          description: 'All medications are safe',
          imgPath: 'assets/image/drag_checker.png',
          isSelected: false),
      InfoContainerModel(
          title: 'Physiotherapy',
          subtitle: '3 New Sessions',
          description: 'Scheduled this week',
          imgPath: 'assets/image/Physiotherapy.png',
          isSelected: true),
      InfoContainerModel(
          title: 'Inquiries',
          subtitle: '2 Pending',
          description: 'Awaiting doctor response',
          imgPath: 'assets/image/inquiries.png',
          isSelected: false),
    ];

    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: infoCards.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final card = infoCards[index];

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: InfoContainer(
            title: card.title,
            subtitle: card.subtitle,
            description: card.description,
            imgPath: card.imgPath,
            isSelected: selectedIndex == index,
          ),
        );
      },
    );
  }
}
