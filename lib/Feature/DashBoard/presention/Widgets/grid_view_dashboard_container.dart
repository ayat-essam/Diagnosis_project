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
        title: 'Medical Files',
        subtitle: '12 file Uploaded',
        description: 'Last update . Nov 20',
        imgPath: 'assets/image_SVG/Medical FilesIcon.svg',
      ),
      InfoContainerModel(
        title: 'Drug Checker',
        subtitle: '0 Conflicts',
        description: 'All medications are safe',
        imgPath: 'assets/image_SVG/Vector.svg',
      ),
      InfoContainerModel(
        title: 'Physiotherapy',
        subtitle: '3 New Sessions',
        description: 'Scheduled this week',
        imgPath: 'assets/image_SVG/Physiotherapy.svg',
      ),
      InfoContainerModel(
        title: 'Inquiries',
        subtitle: '2 Pending',
        description: 'Awaiting doctor response',
        imgPath: 'assets/image_SVG/Inquiries.svg',
      ),
    ];

    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: infoCards.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
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
            infoContainerModel: card,
            isSelected: selectedIndex == index,
          ),
        );
      },
    );
  }
}
