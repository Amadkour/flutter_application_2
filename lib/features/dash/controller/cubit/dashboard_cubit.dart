import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/features/dash/controller/cubit/dashboard_state.dart';
import 'package:flutter_application_2/features/dash/model/repo/apis_data.dart';
import 'package:flutter_application_2/features/dash/model/repo/local_db_data.dart';
import 'package:flutter_application_2/features/dash/model/repo/parent_data.dart';

class DashboardCubit extends Cubit<DashboardStat> {
  late MyParentData resourceRepo;
  late List data;
  DashboardCubit() : super(DashboardInitial()) {
    bool network = false;
    resourceRepo = network ? APISData() : LocalDBData();

    ///fetch data from repo

    fetch();
  }

  Future<void> fetch() async {
    emit(DashboardDataLoading());
    await (resourceRepo as LocalDBData).init();
    data = await resourceRepo.fetch();
    emit(DashboardDataLoaded());
  }

  void delete() {
    emit(DashboardDataLoading());
    resourceRepo.delete(id: 0);
    emit(DashboardDataLoaded());
  }

  void add() {
    emit(DashboardDataLoading());

    resourceRepo.insert(name: "");
    emit(DashboardDataLoaded());
  }

  await(LocalDBData resourceRepo) {}
}
