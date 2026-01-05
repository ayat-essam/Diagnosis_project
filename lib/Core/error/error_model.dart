class ErrorModel {
  final String errorMessage;
  final dynamic errors;
  //final int? status;

  ErrorModel({
    required this.errorMessage,
    this.errors,
    /*this.status*/
  });
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      errorMessage: jsonData["title"]?.toString() ?? "Unknown error",
      errors: jsonData["errors"],
      // status: jsonData[ApiKey.statusCode] is int
      //     ? jsonData[ApiKey.statusCode]
      //     : int.tryParse(jsonData[ApiKey.statusCode]?.toString() ?? ''),
    );
  }

  String getAllErrorMessages() {
    if (errors == null || errors!.isEmpty) {
      return errorMessage ?? "Unknown error occurred";
    }

    final errorMessages = errors!.entries.map((entry) {
      final messages = entry.value.join(", ");
      return messages;
    }).join("\n");
    print(errorMessages);
    return errorMessages;
  }
}
