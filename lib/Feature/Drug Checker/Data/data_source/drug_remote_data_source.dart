import '../../../../Core/api/api_consumer.dart';
import '../Models/drug_check_model.dart';
import '../Models/drug_suggestion_model.dart';

abstract class DrugRemoteDataSource {
  Future<DrugCheckModel> checkDrug(String name);
  Future<List<DrugSuggestionModel>> getSuggestions(String keyword);
}

class DrugRemoteDataSourceImpl extends DrugRemoteDataSource {
  final ApiConsumer api;

  DrugRemoteDataSourceImpl(this.api);

  @override
  Future<DrugCheckModel> checkDrug(String name) async {
    final response = await api.post(
      '/DrugChecker/check',
      data: {'drugName': name},
    );
    return DrugCheckModel.fromJson(response);
  }

  @override
  Future<List<DrugSuggestionModel>> getSuggestions(String keyword) async {
    final response = await api.get(
      '/DrugChecker/suggestions',
      queryParameters: {'keyword': keyword},
    );
    return List<DrugSuggestionModel>.from(
      response.map((e) => DrugSuggestionModel.fromJson(e)),
    );
  }
}
