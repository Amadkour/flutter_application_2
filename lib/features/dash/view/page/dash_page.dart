import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/dash/controller/cubit/dashboard_cubit.dart';
import 'package:flutter_application_2/features/dash/controller/cubit/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashPage extends StatelessWidget {
  const DashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardStat>(
        builder: (context, state) {
          final DashboardCubit controller = context.read<DashboardCubit>();
          return Scaffold(
              appBar: AppBar(
                title: Text("Dashboard"),
                actions: [
                  IconButton(
                      onPressed: () {
                        controller.add();
                      },
                      icon: Icon(CupertinoIcons.add))
                ],
              ),
              body: state is DashboardDataLoading
                  ? CircularProgressIndicator()
                  : Column(
                      children: List.generate(
                          controller.data.length,
                          (index) => Row(
                                children: [
                                  Text(controller.data[index]['name']),
                                  Text(controller.data[index]['address']),
                                ],
                              )),
                    ));
        },
      ),
    );
  }
}
