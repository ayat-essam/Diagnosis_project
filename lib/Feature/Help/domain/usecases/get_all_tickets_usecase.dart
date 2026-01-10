import '../repositories/help_repository.dart';

class GetAllTicketsUseCase {
  final HelpRepository repository;
  GetAllTicketsUseCase(this.repository);

  Future<void> call() => repository.getAllTickets();
}