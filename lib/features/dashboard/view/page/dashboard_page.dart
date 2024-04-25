import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/dashboard/controller/dashboard_controller.dart';
import 'package:flutter_application_2/features/dashboard/controller/dashboard_state.dart';
import 'package:flutter_application_2/features/dashboard/modules/users/view/page/user_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashbordPage extends StatelessWidget {
  final List<String> titles = const ['Home', 'Users', 'Services'];

  const DashbordPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardController(),
      child: BlocBuilder<DashboardController, DashboardState>(
        builder: (context, state) {
          DashboardController controller = context.read<DashboardController>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.yellow,
              title: Text(
                titles[controller.selectedTapIndex],
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'registration');
                    },
                    icon: Icon(CupertinoIcons.add))
              ],
            ),
            body: PageView(
              controller: controller.pageController,
              onPageChanged: controller.onChangeTabIndex,
              children: const [
                Text('Home'),
                UserPage(),
                Text('Services'),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.selectedTapIndex,
              onTap: controller.onChangeTabIndex,
              unselectedItemColor: Colors.black,
              showUnselectedLabels: true,
              unselectedLabelStyle: const TextStyle(fontSize: 15, color: Colors.red),
              items: const [
                BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'home'),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'users'),
                BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Services'),
              ],
            ),
          );
        },
      ),
    );
  }
}
