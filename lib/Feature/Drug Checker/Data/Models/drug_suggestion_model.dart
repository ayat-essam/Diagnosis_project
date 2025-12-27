import '../../Domain/Entities/drug_suggestion_entity.dart';

class DrugSuggestionModel extends DrugSuggestionEntity {
  DrugSuggestionModel({
    required super.name,
    required super.shortDescription,
  });

  factory DrugSuggestionModel.fromJson(Map<String, dynamic> json) {
    return DrugSuggestionModel(
      name: json['name'],
      shortDescription: json['shortDescription'],
    );
  }
}
