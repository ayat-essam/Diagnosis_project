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
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI4NjA5NWMwMy1iNDE1LTQ0YjMtYTY0ZS1mOWE1YzczYzc0NDMiLCJlbWFpbCI6Im5hc3NlcmF5YTAwN0BnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Ijg2MDk1YzAzLWI0MTUtNDRiMy1hNjRlLWY5YTVjNzNjNzQ0MyIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlBhdGllbnQiLCJleHAiOjE3Njg2Njc4NDUsImlzcyI6IkRpYWdub3Npc0FQSSIsImF1ZCI6IkRpYWdub3Npc0NsaWVudCJ9.HoOceKgTzMDjlmVh7xCx4W3lsbn2yojbz-bIY21ix7A';
        //tooken admin'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiZDQyYjgzMC1lZDhhLTRiODgtYWFlNC0yNzUxODM0NzAwMzEiLCJlbWFpbCI6ImFkbWluQGRpYWdub3Npcy5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImJkNDJiODMwLWVkOGEtNGI4OC1hYWU0LTI3NTE4MzQ3MDAzMSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkFkbWluIiwiZXhwIjoxNzY4MzYyMzI4LCJpc3MiOiJEaWFnbm9zaXNBUEkiLCJhdWQiOiJEaWFnbm9zaXNDbGllbnQifQ.n1qtJel8zOt0byqiSPIMHvHYtgBp5r8x-d391B8vxUo';
    //}

    super.onRequest(options, handler);
  }
}
