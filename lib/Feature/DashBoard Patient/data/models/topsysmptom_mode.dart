class TopsysmptomModel {
  String? symptom;

  TopsysmptomModel.TopsysmptomModel({this.symptom});

  factory TopsysmptomModel.fromJson(Map<String, dynamic> json) {
    return TopsysmptomModel.TopsysmptomModel(
      symptom: json['symptom'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'symptom': symptom,
      };
}
