import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_faqs_usecase.dart';
import '../../domain/usecases/create_ticket_usecase.dart';
import '../../domain/entities/faq_entity.dart';

part 'help_state.dart';

class HelpCubit extends Cubit<HelpState> {
  final GetFaqsUseCase getFaqsUseCase;
  final CreateTicketUseCase createTicketUseCase;

  HelpCubit({
    required this.getFaqsUseCase,
    required this.createTicketUseCase,
  }) : super(HelpInitial());

  List<FaqEntity> faqs = [];

  /// Get FAQs
  Future<void> getFaqs(String type) async {
    emit(HelpLoading());
    try {
      faqs = await getFaqsUseCase(type);
      emit(FaqsLoaded(faqs));
    } catch (e) {
      emit(HelpError(e.toString()));
    }
  }

  /// Create Ticket
  Future<void> createTicket({
    required String subject,
    required String details,
  }) async {
    emit(TicketLoading());
    try {
      await createTicketUseCase(
        subject: subject,
        details: details,
      );
      emit(TicketSuccess());
    } catch (e) {
      emit(HelpError(e.toString()));
    }
  }
}
