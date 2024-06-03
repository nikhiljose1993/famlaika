import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../services/theme_service.dart';
import 'personal_information_viewmodel.dart';

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = locator<ThemeService>().theme;

    return ViewModelBuilder<PersonalInformationViewModel>.reactive(
      viewModelBuilder: () {
        return PersonalInformationViewModel();
      },
      builder: (context, viewModel, child) {
        return Scaffold();
      },
    );
  }
}
