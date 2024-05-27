import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () {
        return SplashViewModel();
      },

      // onViewModelReady: (model) {
      //   return model.startTimer();
      // },

      builder: (context, viewModel, child) {
        return Scaffold();
      },
    );
  }
}
