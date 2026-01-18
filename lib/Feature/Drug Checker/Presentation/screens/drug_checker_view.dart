import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagnosis_project/Feature/Drug Checker/Presentation/cubit/drug_checker_cubit.dart';
import 'package:diagnosis_project/Feature/Drug Checker/Presentation/screens/widgets/appbarWidget.dart';
import 'package:diagnosis_project/Feature/Drug Checker/Presentation/screens/widgets/drug_card.dart';
import 'package:diagnosis_project/Feature/Drug%20Checker/Presentation/screens/widgets/gradientCard.dart';
import 'package:diagnosis_project/Feature/Drug Checker/Presentation/screens/widgets/searchBarWidget.dart';

class DrugCheckerView extends StatefulWidget {
  DrugCheckerView({super.key});

  @override
  State<DrugCheckerView> createState() => _DrugCheckerViewState();
}

class _DrugCheckerViewState extends State<DrugCheckerView> {
  @override
  void initState() {
    super.initState();
    context.read<DrugCheckerCubit>().checkDrug("Panadol");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DrugAppBar(),
      body: BlocBuilder<DrugCheckerCubit, DrugCheckerState>(
        builder: (context, state) {
          if (state is DrugCheckerLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DrugCheckerLoaded) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "Drug Checker",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  searchbarwidget("Search Drug"),
                  SizedBox(height: 20),
                  DrugCard(
                    data: state.drugResult,
                  ),
                  gradientCard(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Compare Reports",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Image.asset("assets/image/hand.png")
                        ],
                      ),
                      SizedBox(height: 6),
                      const Text(
                        "Compare old and new reports to track your progress.",
                        style: TextStyle(fontSize: 10),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Start comparison",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            );
          }
          if (state is DrugCheckerError) {
            return Center(
              child: Text(state.message),
            );
          }
          return Center(
            child: Text("Start Checking drug"),
          );
        },
      ),
    );
  }
}
