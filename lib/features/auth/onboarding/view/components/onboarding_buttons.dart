import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingButtonWidget extends StatelessWidget {
  OnboardingButtonWidget({super.key, required this.controller});
  OnboardingControllerCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingControllerCubit>.value(
      value: controller,
      child: BlocBuilder<OnboardingControllerCubit, OnboardingControllerState>(
        builder: (context, state) {
          OnboardingControllerCubit controller = context.read<OnboardingControllerCubit>();

          return SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      controller.onCallSkip(context);
                    },
                    child: const Text("Skip")),
                TextButton(onPressed: controller.onChangeToNext, child: const Text("next"))
              ],
            ),
          );
        },
      ),
    );
  }
}
