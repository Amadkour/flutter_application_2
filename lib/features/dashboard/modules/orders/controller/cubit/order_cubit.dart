import 'package:bloc/bloc.dart';
import 'package:flutter_application_2/core/utils/sqlite_database.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderLoading()) {
    init();
  }
  List data = [];
  init() async {
    await Future.delayed(Duration(seconds: 2));
    data = (await (await MyDatabase.instance).read()).toList();

    emit(OrderLoaded());
  }

  Future<void> addItem() async {
    await (await MyDatabase.instance).insert('Ahmed Madkour', 'Tanta');
    data.insert(0, <String, Object?>{'name': 'Ahmed Madkour', 'address': 'Tanta'});
    emit(OrderLoaded());
  }
}
