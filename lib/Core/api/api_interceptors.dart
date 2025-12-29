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
      options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI3MzRiYzMzNC0wOWM2LTQyOTQtYmIyMS0xNGMxY2QxYjk4NGYiLCJlbWFpbCI6ImF5YWEubmFzc3NlckBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjczNGJjMzM0LTA5YzYtNDI5NC1iYjIxLTE0YzFjZDFiOTg0ZiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlBhdGllbnQiLCJleHAiOjE3Njc2NTQzMDIsImlzcyI6IkRpYWdub3Npc0FQSSIsImF1ZCI6IkRpYWdub3Npc0NsaWVudCJ9.Mn2vM63xYEL5mzfRYEZ42jrK2x4utR2crNCpUePrBdM';
    //}

    super.onRequest(options, handler);
  }
}
