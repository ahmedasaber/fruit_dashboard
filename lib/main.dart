import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:fruit_dashboard/core/utils/app_colors.dart';
import 'package:fruit_dashboard/features/dashboard/presentation/views/dashboard_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      onGenerateRoute: onGenerateRoutes,
      initialRoute: DashboardView.routeName,

      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white
        )
      ),
    );
  }
}
