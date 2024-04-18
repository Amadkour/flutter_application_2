import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/features/auth/onboarding/view/page/onboarding_page.dart';
import 'package:flutter_application_2/features/dash/view/page/dash_page.dart';
import 'package:flutter_application_2/features/dashboard/modules/orders/controller/cubit/order_cubit.dart';
import 'package:flutter_application_2/features/dashboard/modules/orders/view/page/new_order.dart';
import 'package:flutter_application_2/features/dashboard/view/page/my_page.dart';
import 'package:flutter_application_2/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/registration/view/page/registration_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // runApp(MaterialApp(
  //   onGenerateRoute: Routes.route,
  //   onGenerateInitialRoutes: (_) {
  //     return <Route<dynamic>>[
  //       Routes.route(
  //         const RouteSettings(name: '/login'),
  //       ),
  //     ];
  //   },
  // ));

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool onBording = sharedPreferences.getBool('onboarding') ?? false;

  MaterialApp materialApp = MaterialApp(
    // home: onBording ? const RegistrationPage() : const OnBoardingPage(),
    onGenerateRoute: MyRoutes.onGenerateRoute,
    onGenerateInitialRoutes: (_) => MyRoutes.initRoutes,
  );

  runApp(materialApp);
}

class MyRoutes {
  static List<Route> initRoutes = [
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => const OnBoardingPage(),
    ),
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => const RegistrationPage(),
    ),
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => const DashPage(),
    ),
  ];
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        final List data = settings.arguments as List;
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => Login(
            firstName: data[0] as String,
            lastname: data[1] as String,
          ),
        );
      case 'registration':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const RegistrationPage(),
        );
      case 'new_order':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => NewOrder(
            controller: settings.arguments as OrderCubit,
          ),
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const OnBoardingPage(),
        );
    }
  }
}
