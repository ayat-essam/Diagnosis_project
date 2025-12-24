import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial(const Locale('en')));

  void changeToEnglish() {
    emit(LocaleChanged(const Locale('en')));
  }

  void changeToArabic() {
    emit(LocaleChanged(const Locale('ar')));
  }
}
