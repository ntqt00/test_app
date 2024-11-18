import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_qlcv/presentation/splash/bloc/splash_cubit.dart';
import 'package:mobile_qlcv/presentation/splash/pages/splash.dart';
import 'package:mobile_qlcv/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: AppTheme.appTheme,
          home: SplashPage()),
    );
  }
}
