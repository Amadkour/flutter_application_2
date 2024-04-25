import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/firebase/my_firebase.dart';
import 'package:flutter_application_2/features/auth/onboarding/view/page/onboarding_page.dart';
import 'package:flutter_application_2/features/dashboard/view/page/dashboard_page.dart';
import 'package:flutter_application_2/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/registration/view/page/registration_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await MyFirebase().init();
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
    builder: DevicePreview.appBuilder,
    useInheritedMediaQuery: true,
    onGenerateRoute: MyRoutes.onGenerateRoute,
    onGenerateInitialRoutes: (_) => MyRoutes.initRoutes,
  );

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => materialApp, // Wrap your app
    ),
  );
}

class MyRoutes {
  static List<Route> initRoutes = [
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => const DashbordPage(),
    ),
  ];
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        final List data = settings.arguments as List;
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => DashbordPage(),
        );
      case 'registration':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const RegistrationPage(),
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const OnBoardingPage(),
        );
    }
  }
}
