import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_bloc/appLocalization.dart';
import 'package:localization_bloc/appLocalizationCubit.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                context
                    .read<AppLocalizationCubit>()
                    .changeLanguage(Language.english);
              },
              child: Text(
                AppLocalization.of(context).getTranslatedValues("english")!,
              ),
            ),
            GestureDetector(
              onTap: () {
                context
                    .read<AppLocalizationCubit>()
                    .changeLanguage(Language.gujarati);
              },
              child: Text(
                AppLocalization.of(context).getTranslatedValues("gujarati")!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
