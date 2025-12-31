import '../Entities/drug_check_entity.dart';
import '../Entities/drug_suggestion_entity.dart';

abstract class DrugRepository {
  Future<DrugCheckEntity> checkDrug(String drugName);
  Future<List<DrugSuggestionEntity>> getSuggestions(String keyword);
}
