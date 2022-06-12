import 'package:provider/provider.dart';

import 'Provider/home_provider/home_provider.dart';
import 'Utils/app_theme.dart';
import 'package:flutter/material.dart';

import 'Utils/navigation/navigation_service.dart';
import 'Utils/navigation/route_generator.dart';
import 'Utils/navigation/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Instant Aadhar card loan',
        theme: AppTheme.appThemeData,
        initialRoute: Routes.root,
        onGenerateRoute: generateRoute,
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.globalNavigatorKey,
      ),
    );
  }
}
