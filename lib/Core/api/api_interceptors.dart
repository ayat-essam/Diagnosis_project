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
      options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5MGJiOGFhNS1mODczLTQ5NTYtYWE3Yi0xNzhmMDMwZDg0NjYiLCJlbWFpbCI6ImFkbWluQGRpYWdub3Npcy5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjkwYmI4YWE1LWY4NzMtNDk1Ni1hYTdiLTE3OGYwMzBkODQ2NiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkFkbWluIiwiZXhwIjoxNzY3NzQ1OTUwLCJpc3MiOiJEaWFnbm9zaXNBUEkiLCJhdWQiOiJEaWFnbm9zaXNDbGllbnQifQ.GvbMFylM8HcZQlT1UKj20TLo8SNG96-kXAzeUIKhi1Q';
    //}

    super.onRequest(options, handler);
  }
}
