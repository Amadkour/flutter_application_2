import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/dashboard/controller/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardController extends Cubit<DashboardState> {
  DashboardController() : super(DashboardChangeState());

  int selectedTapIndex = 0;
  final PageController pageController = PageController();

  void onChangeTabIndex(int index) {
    if (index == 2) {
      throw 'dummy exception from mobile';
    }
    selectedTapIndex = index;
    pageController.jumpToPage(selectedTapIndex);
    emit(DashboardChangeState());
  }
}
