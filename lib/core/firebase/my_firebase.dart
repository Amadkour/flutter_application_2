import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/firebase_options.dart';

class MyFirebase {
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Pass all uncaught "fatal" errors from the framework to Crashlytics
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

//     ///fcm
//     await FirebaseMessaging.instance.setAutoInitEnabled(true);
//
//     /// for spesific clients
//     final fcmToken = await FirebaseMessaging.instance.getToken();
//     log(fcmToken.toString());
  }

  ///remote config
  Future<String> serverUrl() async {
    String value = "";
    try {
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

      ///fetch and activate
      await remoteConfig.fetchAndActivate();

      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(seconds: 1),
        ),
      );
      value = remoteConfig.getString("url");
    } catch (e) {
      value = "";
    }

    return value;
  }

  Future<void> initDynamicLinks() async {
    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

    dynamicLinks.onLink.listen((dynamicLinkData) {
      // Listen and retrieve dynamic links here
      final String deepLink = dynamicLinkData.link.toString(); // Get DEEP LINK
      // Ex: https://namnp.page.link/product/013232
      final String path = dynamicLinkData.link.path; // Get PATH
      // Ex: product/013232
      if (deepLink.isEmpty) return;
      handleDeepLink(path);
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }

  void handleDeepLink(String path) {
    // navigate to detailed product screen
  }
}
