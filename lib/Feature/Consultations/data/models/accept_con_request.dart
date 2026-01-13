import 'package:json_annotation/json_annotation.dart';
part 'accept_con_request.g.dart';

@JsonSerializable()
class AcceptResponse {
  bool? success;
  String? errorMessage;

  AcceptResponse({this.success, this.errorMessage});

  AcceptResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['errorMessage'] = this.errorMessage;
    return data;
  }
}
