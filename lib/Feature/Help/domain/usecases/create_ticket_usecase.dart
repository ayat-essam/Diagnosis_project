import '../repositories/help_repository.dart';

class CreateTicketUseCase {
  final HelpRepository repository;

  CreateTicketUseCase(this.repository);

  Future<void> call({
    required String subject,
    required String details,
  }) {
    return repository.createTicket(subject, details);
  }
}
