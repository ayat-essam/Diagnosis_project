import 'package:flutter/material.dart';
import '../../data/models/info_container_model.dart';
import 'info_container.dart';

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
        title: 'Top Drug Search',
        subtitle: 'Paracetamol',
        description: 'Most searched this week',
        imgPath: 'assets/image_SVG/top_drug _search.svg',
      ),
      InfoContainerModel(
        title: 'Top Symptom',
        subtitle: 'Headache',
        description: 'Most viewed by patients',
        imgPath: 'assets/image_SVG/Top_Symptom.svg',
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
