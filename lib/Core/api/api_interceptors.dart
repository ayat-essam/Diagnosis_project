import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.data is FormData) {
      options.headers['Content-Type'] = 'multipart/form-data';
    } else {
      options.headers['Content-Type'] = 'application/json';
    }

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    //if (token != null) {
      options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxYjkwYzk0Zi05YTJlLTQyNmYtOTAzOS1kY2ZjNzkxODllZWEiLCJlbWFpbCI6ImF5YWEubmFzc3NlckBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjFiOTBjOTRmLTlhMmUtNDI2Zi05MDM5LWRjZmM3OTE4OWVlYSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlBhdGllbnQiLCJleHAiOjE3NjgyMTI0MzksImlzcyI6IkRpYWdub3Npc0FQSSIsImF1ZCI6IkRpYWdub3Npc0NsaWVudCJ9.5TF-0IKgMwz-QFheUFIpdG4oX-TUWIsxyvlu9ETORqg';
    //}

    super.onRequest(options, handler);
  }
}
