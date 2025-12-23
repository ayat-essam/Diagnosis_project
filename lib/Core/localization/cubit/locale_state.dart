part of 'locale_cubit.dart';

@immutable
sealed class LocaleState {}

class LocaleInitial extends LocaleState {
  final Locale locale;
  LocaleInitial(this.locale);
}

class LocaleChanged extends LocaleState {
  final Locale locale;
  LocaleChanged(this.locale);
}
