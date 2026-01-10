import 'package:dio/dio.dart';
import '../models/faq_model.dart';

abstract class HelpRemoteDataSource {
  Future<List<FaqModel>> getFaqs(String type);
  Future<void> createTicket(Map<String, dynamic> body);
  Future<void> getAllTickets();
  Future<void> replyTicket(Map<String, dynamic> body);
  Future<void> getTicketContent(int ticketId);
}

class HelpRemoteDataSourceImpl implements HelpRemoteDataSource {
  final Dio dio;

  HelpRemoteDataSourceImpl(this.dio);

  @override
  Future<List<FaqModel>> getFaqs(String type) async {
    final response = await dio.get('/Help/faqs', queryParameters: {
      'Type': type,
    });

    return (response.data as List)
        .map((e) => FaqModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> createTicket(Map<String, dynamic> body) async {
    await dio.post('/SupportTicket/create', data: body);
  }

  @override
  Future<void> getAllTickets() async {
    await dio.get('/SupportTicket/all');
  }

  @override
  Future<void> replyTicket(Map<String, dynamic> body) async {
    await dio.post('/SupportTicket/reply', data: body);
  }

  @override
  Future<void> getTicketContent(int ticketId) async {
    await dio.get('/SupportTicket/content/$ticketId');
  }
}
