import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playground/ui/custom_dialog/dialog_ui_setup.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';

/// Follow the step below to create a custom_Dialog
/// 1. Install stacked package(by filledStacks) for state management
/// 2. Install stacked_service for Navigation & other service related functions
/// 3. create a 'app' folder in lib, in it create app.dart, write to it and run:
/// flutter pub run build_runner build --delete-conflicting-outputs
/// 4. Each time you make changes to app.dart, in terminal you will have to run:
/// flutter pub run build_runner build --delete-conflicting-outputs

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(); // Register d services functions registered in d locator
  setupDialogUI(); // Dis will register our dialogUI
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // The stacked_services: package provide you with NavigationServices, DialogService,
      // snackBarServices, BottomSheetServices. We will like to show dem from our viewModel
      // and not have to do it inside of our UI code
      navigatorKey: StackedService.navigatorKey,
      // We construct a new instance of StackedRouter. The router dart will
      // be generated when we run the 'flutter pub run build_runner build
      // --delete-conflicting-outputs' command. A app.router.dart file will be
      // created in the app folder.
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
  // 'flutter pub run build_runner build --delete-conflicting-outputs'
}
