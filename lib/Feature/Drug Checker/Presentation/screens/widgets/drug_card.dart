import 'package:flutter/widgets.dart';
import 'package:diagnosis_project/Feature/Drug Checker/Domain/Entities/drug_check_entity.dart';
import 'package:diagnosis_project/Feature/Drug%20Checker/Presentation/screens/widgets/gradientCard.dart';

class DrugCard extends StatelessWidget {
  final List<DrugCheckEntity> data;
  DrugCard({required this.data});
  List titleCard = ["Dosage", "Age", "Interactions", "PDF Reports"];
  List nameIcon = ["hand.png", "sideeffect.png", "interaction.png", "age.png"];
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            itemCount: data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 2,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return gradientCard(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${titleCard[index]}"),
                      ),
                      Image.asset("assets/image/${nameIcon[index]}"),
                    ],
                  ),
                ],
              ));
            }));
  }
}
