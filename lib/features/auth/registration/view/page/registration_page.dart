import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/utils/context_extension.dart';
import 'package:flutter_application_2/features/auth/registration/controller/cubit/registration_cubit.dart';
import 'package:flutter_application_2/features/auth/registration/view/components/bottom_widget.dart';
import 'package:flutter_application_2/features/auth/registration/view/components/required_data_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<RegistrationCubit>(
        create: (context) => RegistrationCubit(),
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            final RegistrationCubit controller = context.read<RegistrationCubit>();
            return Scaffold(
              appBar: AppBar(),
              body: RequiredDataWidget(
                controller: controller,
              ),
              bottomNavigationBar: SizedBox(
                height: context.height / 4,
                child: BottomNavigationWiget(
                  controller: controller,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
