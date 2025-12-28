part of 'drug_checker_cubit.dart';

@immutable
sealed class DrugCheckerState {}

final class DrugCheckerrInitial extends DrugCheckerState {}

class DrugCheckerInitial extends DrugCheckerState {}

class DrugCheckerLoading extends DrugCheckerState {}

class DrugCheckerLoaded extends DrugCheckerState {
  final List <DrugCheckEntity> drugResult;
  final List<DrugSuggestionEntity> suggestion;
  DrugCheckerLoaded({required this.drugResult, required this.suggestion});
}

class DrugCheckerError extends DrugCheckerState {
  final String message;
  DrugCheckerError(this.message);
}
