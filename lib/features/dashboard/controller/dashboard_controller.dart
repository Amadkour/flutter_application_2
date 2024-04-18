import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/dashboard/controller/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardController extends Cubit<DashboardState> {
  DashboardController() : super(DashboardInitializationState());
  Color backgroundColor = const Color(0xFFFFA000);

  void changeBackground() {
    if (backgroundColor == Colors.green) {
      backgroundColor = Colors.blue;
    } else {
      backgroundColor = Colors.green;
    }
    emit(DashboardChangeBackgroundState());
  }
}
