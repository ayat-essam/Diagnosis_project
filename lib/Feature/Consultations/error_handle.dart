class ErrorHandler {
  final String message;
  final int statusCode;
  final dynamic data;

  const ErrorHandler({
    required this.message,
    required this.statusCode,
    this.data,
  });
}