import '../entities/faq_entity.dart';
import '../repositories/help_repository.dart';

class GetFaqsUseCase {
  final HelpRepository repository;

  GetFaqsUseCase(this.repository);

  Future<List<FaqEntity>> call(String type) {
    return repository.getFaqs(type);
  }
}
