import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:diagnosis_project/Feature/Drug Checker/Domain/Entities/drug_check_entity.dart';
import 'package:diagnosis_project/Feature/Drug Checker/Domain/Entities/drug_suggestion_entity.dart';
import 'package:diagnosis_project/Feature/Drug Checker/Domain/UseCases/check_drug_usecase.dart';
import 'package:diagnosis_project/Feature/Drug Checker/Domain/UseCases/get_drug_suggestions_usecase.dart';

part 'drug_checker_state.dart';

class DrugCheckerCubit extends Cubit<DrugCheckerState> {
  final CheckDrugUseCase checkUserCase;
  final GetDrugSuggestionsUseCase getDrugSuggestionsUseCase;
  DrugCheckerCubit(
      {required this.checkUserCase, required this.getDrugSuggestionsUseCase})
      : super(DrugCheckerrInitial());

  Future<void> checkDrug(String drugName) async {
    emit(DrugCheckerLoading());
    try {
      final drugResult = await checkUserCase(drugName);
      final suggestion = await getDrugSuggestionsUseCase(drugName);
      emit(DrugCheckerLoaded(drugResult: [drugResult], suggestion: suggestion));
    } catch (e) {
      emit(DrugCheckerError(e.toString()));
    }
  }
}
