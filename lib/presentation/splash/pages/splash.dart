import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/helpers/app_navigation.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../home/pages/home_page.dart';
import '../../login/pages/login.dart';
import '../bloc/splash_cubit.dart';
import '../bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            AppNavigator.pushReplacement(context, LoginPage());
          }

          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.splashBackground),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
