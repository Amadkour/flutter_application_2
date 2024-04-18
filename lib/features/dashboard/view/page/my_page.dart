import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/dashboard/view/components/my_design.dart';

class Login extends StatelessWidget {
  const Login({super.key, required this.firstName, required this.lastname});
  final String firstName, lastname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("$firstName $lastname"),
      ),
      body: const MyDesign(),
    );
  }
}
