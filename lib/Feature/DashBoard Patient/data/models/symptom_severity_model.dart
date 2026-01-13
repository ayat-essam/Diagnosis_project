class SymptomSeverityModel {
  int? monday;

  SymptomSeverityModel({this.monday});

  factory SymptomSeverityModel.fromJson(Map<String, dynamic> json) {
    return SymptomSeverityModel(
      monday: json['Monday'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'Monday': monday,
      };
}
