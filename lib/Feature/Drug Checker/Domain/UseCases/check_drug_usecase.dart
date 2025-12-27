import '../Entities/drug_check_entity.dart';
import '../Repository/drug_repository.dart';

class CheckDrugUseCase {
  final DrugRepository repository;

  CheckDrugUseCase(this.repository);

  Future<DrugCheckEntity> call(String drugName) {
    return repository.checkDrug(drugName);
  }
}
