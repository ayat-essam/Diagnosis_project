part of 'help_cubit.dart';

abstract class HelpState {}

class HelpInitial extends HelpState {}

class HelpLoading extends HelpState {}

class FaqsLoaded extends HelpState {
  final List<FaqEntity> faqs;
  FaqsLoaded(this.faqs);
}

class TicketLoading extends HelpState {}

class TicketSuccess extends HelpState {}

class HelpError extends HelpState {
  final String message;
  HelpError(this.message);
}
