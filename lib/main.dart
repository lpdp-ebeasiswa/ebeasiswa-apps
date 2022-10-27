import 'package:catcher/catcher.dart';
import 'package:ebeasiswa/ebeasiswa_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'app/utilities/catcher_setup.dart';
import 'package:get_storage/get_storage.dart';
const appName = 'Klix Agent';

void runEbeasiswaApp() async{
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await GetStorage.init();
  await _firebaseSetup();
  Catcher(
    rootWidget: const EbeasiswaApp(),
    debugConfig: CatcherSetup.debug(),
    releaseConfig: CatcherSetup.release(),
    profileConfig: CatcherSetup.debug(),
  );
}

Future<void> _firebaseSetup() async {
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate();
}

void main() {}