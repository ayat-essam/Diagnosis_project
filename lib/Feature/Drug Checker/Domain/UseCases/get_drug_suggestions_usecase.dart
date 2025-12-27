import '../Entities/drug_suggestion_entity.dart';
import '../Repository/drug_repository.dart';

class GetDrugSuggestionsUseCase {
  final DrugRepository repository;

  GetDrugSuggestionsUseCase(this.repository);

  Future<List<DrugSuggestionEntity>> call(String keyword) {
    return repository.getSuggestions(keyword);
  }
}
