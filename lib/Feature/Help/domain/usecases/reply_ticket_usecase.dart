import '../repositories/help_repository.dart';

class ReplyTicketUseCase {
  final HelpRepository repository;
  ReplyTicketUseCase(this.repository);

  Future<void> call(int id, String reply) =>
      repository.replyTicket(id, reply);
}