import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/dashboard/modules/orders/controller/cubit/order_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewOrder extends StatelessWidget {
  const NewOrder({super.key, required this.controller});
  final OrderCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                TextField(
                  controller: TextEditingController(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: TextEditingController(),
                ),
                FilledButton(
                    onPressed: () {
                      controller.addItem();
                    },
                    child: Text('enter your Data'))
              ],
            ),
          );
        },
      ),
    );
  }
}
