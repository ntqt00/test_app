import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:mobile_qlcv/presentation/splash/bloc/splash_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    // Wait for a couple of seconds to show splash screen
    await Future.delayed(const Duration(seconds: 2));

    // Check if access_token is present in SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token'); // Retrieve token

    if (token == null || isTokenExpired(token)) {
      // Token is expired or not available, redirect to login page
      emit(UnAuthenticated());
    } else {
      // Token is valid, emit Authenticated state
      emit(Authenticated());
    }
  }

  bool isTokenExpired(String token) {
    try {
      Map<String, dynamic> decodedToken = Jwt.parseJwt(token);
      int exp = decodedToken['exp'];
      DateTime expDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
      return DateTime.now().isAfter(expDate);
    } catch (e) {
      return true;
    }
  }
}
