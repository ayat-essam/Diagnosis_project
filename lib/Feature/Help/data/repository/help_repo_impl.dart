import '../../domain/repositories/help_repository.dart';
import '../datasource/help_remote_data_source.dart';
import '../models/support_ticket_request.dart';
import '../models/support_reply_request.dart';
import '../../domain/entities/faq_entity.dart';

class HelpRepositoryImpl implements HelpRepository {
  final HelpRemoteDataSource remote;

  HelpRepositoryImpl(this.remote);

  @override
  Future<List<FaqEntity>> getFaqs(String type) {
    return remote.getFaqs(type);
  }

  @override
  Future<void> createTicket(String subject, String details) {
    final body = SupportTicketRequest(
      subject: subject,
      details: details,
    ).toJson();

    return remote.createTicket(body);
  }

  @override
  Future<void> getAllTickets() {
    return remote.getAllTickets();
  }

  @override
  Future<void> replyTicket(int ticketId, String reply) {
    final body = SupportReplyRequest(
      ticketId: ticketId,
      reply: reply,
    ).toJson();

    return remote.replyTicket(body);
  }

  @override
  Future<void> getTicketContent(int ticketId) {
    return remote.getTicketContent(ticketId);
  }
}
