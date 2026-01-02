import 'package:json_annotation/json_annotation.dart';
part 'modifey_con_request.g.dart';

@JsonSerializable()
class ModifyResponse {
  int? consultationId;
  String? name;
  String? description;
  String? notes;

  ModifyResponse(
      {this.consultationId, this.name, this.description, this.notes});

  ModifyResponse.fromJson(Map<String, dynamic> json) {
    consultationId = json['consultationId'];
    name = json['name'];
    description = json['description'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consultationId'] = this.consultationId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['notes'] = this.notes;
    return data;
  }
}