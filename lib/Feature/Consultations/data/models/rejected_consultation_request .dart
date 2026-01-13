import 'package:json_annotation/json_annotation.dart';
part 'rejected_consultation_request .g.dart';

@JsonSerializable()
class RejectedResponse {
  String? reason;
  String? notes;

  RejectedResponse({this.reason, this.notes});

  RejectedResponse.fromJson(Map<String, dynamic> json) {
    reason = json['reason'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reason'] = this.reason;
    data['notes'] = this.notes;
    return data;
  }
}
