import '../../Domain/Entities/drug_check_entity.dart';
import '../../Domain/Entities/drug_suggestion_entity.dart';
import '../../Domain/Repository/drug_repository.dart';
import '../data_source/drug_remote_data_source.dart';

class DrugRepositoryImpl extends DrugRepository {
  final DrugRemoteDataSource remote;

  DrugRepositoryImpl(this.remote);

  @override
  Future<DrugCheckEntity> checkDrug(String drugName) {
    return remote.checkDrug(drugName);
  }

  @override
  Future<List<DrugSuggestionEntity>> getSuggestions(String keyword) {
    return remote.getSuggestions(keyword);
  }
}
