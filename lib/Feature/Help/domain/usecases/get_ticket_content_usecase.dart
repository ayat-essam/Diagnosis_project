import '../repositories/help_repository.dart';

class GetTicketContentUseCase {
  final HelpRepository repository;
  GetTicketContentUseCase(this.repository);

  Future<void> call(int id) =>
      repository.getTicketContent(id);
}