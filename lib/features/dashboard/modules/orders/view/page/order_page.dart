import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/dashboard/modules/orders/controller/cubit/order_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

List<Color> colors = [Colors.green, Colors.greenAccent, Colors.lightGreen];

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(),
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          final OrderCubit controller = context.read<OrderCubit>();
          return Scaffold(
              appBar: AppBar(
                title: const Text('Order'),
                actions: [
                  IconButton(
                      onPressed: () async {
                        Navigator.pushNamed(context, 'new_order', arguments: controller);
                      },
                      icon: Icon(CupertinoIcons.add))
                ],
              ),
              body: ListView(
                children: [
                  if (state is OrderLoading)
                    const SizedBox(width: 100, height: 10, child: CircularProgressIndicator())
                  else
                    ...List.generate(
                      controller.data.length,
                      (index) => Container(
                        decoration: BoxDecoration(color: colors[index % colors.length].withAlpha(200)),
                        child: Slidable(
                            // Specify a key if the Slidable is dismissible.
                            key: ValueKey(controller.data[index]['id']),

                            // The start action pane is the one at the left or the top side.
                            startActionPane: ActionPane(
                              // A motion is a widget used to control how the pane animates.
                              motion: const ScrollMotion(),

                              // A pane can dismiss the Slidable.
                              dismissible: DismissiblePane(onDismissed: () {}),

                              // All actions are defined in the children parameter.
                              children: [
                                // A SlidableAction can have an icon and/or a label.
                                SlidableAction(
                                  onPressed: (_) {},
                                  backgroundColor: Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                                SlidableAction(
                                  onPressed: (_) {},
                                  backgroundColor: Color(0xFF21B7CA),
                                  foregroundColor: Colors.white,
                                  icon: Icons.share,
                                  label: 'Share',
                                ),
                              ],
                            ),

                            // The end action pane is the one at the right or the bottom side.
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  // An action can be bigger than the others.
                                  flex: 2,
                                  onPressed: (_) {},
                                  backgroundColor: Color(0xFF7BC043),
                                  foregroundColor: Colors.white,
                                  icon: Icons.archive,
                                  label: 'Archive',
                                ),
                                SlidableAction(
                                  onPressed: (_) {},
                                  backgroundColor: Color(0xFF0392CF),
                                  foregroundColor: Colors.white,
                                  icon: Icons.save,
                                  label: 'Save',
                                ),
                              ],
                            ),

                            // The child of the Slidable is what the user sees when the
                            // component is not dragged.
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    controller.data[index]['name'].toString(),
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    controller.data[index]['address'] ?? 'address',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                ],
              ));
        },
      ),
    );
  }
}
