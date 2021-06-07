import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_bloc/appLocalization.dart';
import 'package:localization_bloc/appLocalizationCubit.dart';
import 'package:localization_bloc/nextScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppLocalizationCubit>(
      create: (_) => AppLocalizationCubit(),
      child: Builder(
        builder: (context) {
          //current language
          final currentLanguage =
              context.watch<AppLocalizationCubit>().state.language;
          return MaterialApp(
            locale: supporatedLanguages[currentLanguage],
            localizationsDelegates: [
              AppLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'),
              Locale('gu'),
            ],
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalization.of(context).getTranslatedValues("title")!),
      ),
      body: Center(
        child: GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => NextScreen())),
            child:
                Text(AppLocalization.of(context).getTranslatedValues("name")!)),
      ),
    );
  }
}
