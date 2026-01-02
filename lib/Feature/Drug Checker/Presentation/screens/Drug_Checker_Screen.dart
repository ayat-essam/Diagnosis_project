import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:diagnosis_project/Feature/Drug Checker/Presentation/cubit/drug_checker_cubit.dart';
import 'package:diagnosis_project/Feature/Drug Checker/Presentation/screens/drug_checker_view.dart';
import 'package:diagnosis_project/Feature/Drug Checker/Domain/UseCases/check_drug_usecase.dart';
import 'package:diagnosis_project/Feature/Drug Checker/Domain/UseCases/get_drug_suggestions_usecase.dart';

class DrugCheckerScreen extends StatefulWidget {
  const DrugCheckerScreen({super.key});

  @override
  State<DrugCheckerScreen> createState() => _DrugCheckerScreenState();
}

class _DrugCheckerScreenState extends State<DrugCheckerScreen> {
  final now = DateTime.now();
  late final formatted = DateFormat('EEEE, MMMM d, y').format(now);

  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DrugCheckerCubit(
              checkUserCase: context.read<CheckDrugUseCase>(),
              getDrugSuggestionsUseCase:
                  context.read<GetDrugSuggestionsUseCase>(),
            ),
        child: DrugCheckerView());
  }
}
