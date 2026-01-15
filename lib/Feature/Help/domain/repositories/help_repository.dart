import '../entities/faq_entity.dart';

abstract class HelpRepository {
  Future<List<FaqEntity>> getFaqs(String type);
  Future<void> createTicket(String subject, String details);
  Future<void> getAllTickets(); // Admin
  Future<void> replyTicket(int ticketId, String reply); // Admin
  Future<void> getTicketContent(int ticketId); // Admin
}
