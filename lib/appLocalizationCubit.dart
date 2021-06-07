import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Language { english, gujarati }

Map<Language, Locale> supporatedLanguages = {
  Language.english: Locale('en'),
  Language.gujarati: Locale('gu')
};

class AppLocalizationState {
  final Language language;

  AppLocalizationState({required this.language});
}

class AppLocalizationCubit extends Cubit<AppLocalizationState> {
  AppLocalizationCubit()
      : super(AppLocalizationState(language: Language.english));

  void changeLanguage(Language language) {
    emit(AppLocalizationState(language: language));
  }
}
