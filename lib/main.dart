import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flowery_delivery/flowery_delivery.dart';
import 'core/services/shared_preference/shared_preference_helper.dart';
import 'core/utils/abb_bloc_observer.dart';
import 'di/di.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper().instantiatePreferences();
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

await  dotenv.load(fileName: '.env.firebase');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();


  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(FloweryDelivery(),
  );
}
