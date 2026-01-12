import 'package:dio/dio.dart';
import '../../../../Core/api/api_consumer.dart';
import '../models/faq_model.dart';

abstract class HelpRemoteDataSource {
  Future<List<FaqModel>> getFaqs(String type);
  Future<void> createTicket(Map<String, dynamic> body);
  Future<void> getAllTickets();
  Future<void> replyTicket(Map<String, dynamic> body);
  Future<void> getTicketContent(int ticketId);
}

class HelpRemoteDataSourceImpl implements HelpRemoteDataSource {
  final ApiConsumer api;

  HelpRemoteDataSourceImpl(this.api);

  @override
  Future<List<FaqModel>> getFaqs(String type) async {
    final response = await api.get(
      '/Help/faqs',
      queryParameters: {'Type': type},
    );

    return (response as List).map((e) => FaqModel.fromJson(e)).toList();
  }

  @override
  Future<void> createTicket(Map<String, dynamic> body) async {
    await api.post(
      '/SupportTicket/create',
      data: {
        "subject": "test",
        "details": "test",
      },
      isFormData: false,
    );

    // await api.post('/SupportTicket/create', data: body, isFormData: false);
  }

  @override
  Future<void> getAllTickets() async {
    await api.get('/SupportTicket/all');
  }

  @override
  Future<void> replyTicket(Map<String, dynamic> body) async {
    await api.post('/SupportTicket/reply', data: body);
  }

  @override
  Future<void> getTicketContent(int ticketId) async {
    await api.get('/SupportTicket/content/$ticketId');
  }
}
