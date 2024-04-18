import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_application_2/features/dashboard/controller/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDesign extends StatelessWidget {
  const MyDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardController(),
      child: BlocBuilder<DashboardController, DashboardState>(
        builder: (context, state) {
          final DashboardController controller = context.read<DashboardController>();
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ColoredBox(
              color: controller.backgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Name"),
                  Text("Address"),
                  IconButton(
                    onPressed: () {
                      controller.changeBackground();
                    },
                    icon: Icon(Icons.settings),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
    ;
  }
}
