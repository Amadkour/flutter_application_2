import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/core/utils/context_extension.dart';
import 'package:flutter_application_2/core/utils/validation.dart';
import 'package:flutter_application_2/features/auth/registration/controller/cubit/registration_cubit.dart';
import 'package:flutter_application_2/features/auth/registration/view/components/text_name_formater.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequiredDataWidget extends StatelessWidget {
  RequiredDataWidget({super.key, required this.controller});

  final RegistrationCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          RegistrationCubit controller = context.read<RegistrationCubit>();

          return Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///logo
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        "https://www.shutterstock.com/image-vector/vector-islam-kuran-ramadan-islamic-600w-1492032890.jpg",
                        height: 50,
                        width: 50,
                      ),
                    ),
                    SizedBox(
                      width: context.width / 4,
                    ),
                    const Text(
                      "Sign Up in ABC",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                ///first name
                TextFormField(
                  maxLength: 5,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.firstNameController,
                  keyboardType: TextInputType.name,
                  validator: MyValidation().nameValidate,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z]')),
                    FilteringTextInputFormatter.deny(RegExp(r'[D]')),
                  ],
                  decoration: decoration.copyWith(labelText: 'Fist name'),
                ),

                ///last name

                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.lastNameController,
                  keyboardType: TextInputType.name,
                  validator: MyValidation().nameValidate,
                  decoration: decoration.copyWith(labelText: 'Last Name'),
                ),

                ///age as years

                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.ageController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [MyAgeTextFieldFormater()],
                  // validator: MyValidation().nameValidate,

                  decoration: decoration.copyWith(labelText: 'age'),
                ),

                ///mail

                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.mailController,
                  keyboardType: TextInputType.name,
                  validator: MyValidation().nameValidate,
                  decoration: decoration.copyWith(
                      labelText: 'mail', hintText: 'xxxx@gmail.com', prefixIcon: const Icon(Icons.mail)),
                ),

                ///password

                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.passwordController,
                  keyboardType: TextInputType.name,
                  validator: MyValidation().nameValidate,
                  decoration: decoration.copyWith(
                    labelText: 'password',
                    prefixIcon: const Icon(Icons.lock),
                  ),
                  obscureText: true,
                  obscuringCharacter: "*",
                )
              ],
            ),
          );
        },
      ),
    );
  }

  InputDecoration decoration = InputDecoration(
    border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey, width: 2), borderRadius: BorderRadius.circular(30)),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.circular(5),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2),
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
