import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/auth/onboarding/model/onbording_model.dart';
import 'package:flutter_application_2/features/auth/registration/view/page/registration_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_controller_state.dart';

class OnboardingControllerCubit extends Cubit<OnboardingControllerState> {
  OnboardingControllerCubit() : super(OnboardingControllerInitial());

  PageController pageController = PageController();

  void onChangeToNext() {
    pageController.nextPage(duration: Duration(seconds: 2), curve: Curves.bounceIn);
  }

  Future<void> onCallSkip(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('onboarding', true);
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const RegistrationPage(),
      ),
    );
  }

  List data = [
    OnboardingModel(
      image: 'assets/images/logo.png',
      title: 'First',
      subtitle: 'First screen',
      color: Colors.green,
    ),
    OnboardingModel(
      image: 'assets/images/logo.png',
      title: 'Second',
      subtitle: 'Second screen',
      color: Colors.blue,
    ),
    OnboardingModel(
      image: 'assets/images/logo.png',
      title: 'Third',
      subtitle: 'Third screen',
      color: Colors.red,
    ),
  ];
}
