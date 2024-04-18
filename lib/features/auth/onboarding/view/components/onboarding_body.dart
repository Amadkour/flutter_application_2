import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBody extends StatelessWidget {
  OnboardingBody({super.key, required this.controller});
  OnboardingControllerCubit controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Welcome in our App"),
        Expanded(
          child: BlocProvider<OnboardingControllerCubit>.value(
            value: controller,
            child: BlocBuilder<OnboardingControllerCubit, OnboardingControllerState>(
              builder: (context, state) {
                OnboardingControllerCubit controller = context.read<OnboardingControllerCubit>();

                return PageView(
                  controller: controller.pageController,
                  children: List.generate(controller.data.length, (index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ///image
                        Image.asset(controller.data[index].image),

                        ///title
                        Text(
                          controller.data[index].title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: controller.data[index].color,
                          ),
                        ),

                        ///subtitle
                        Text(
                          controller.data[index].subtitle,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    );
                  }),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
