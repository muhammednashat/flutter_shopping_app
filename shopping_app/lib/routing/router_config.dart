

import 'package:go_router/go_router.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/splash_screen.dart';
import 'package:shopping_app/ui/auth/forgot_password_screen.dart';
import 'package:shopping_app/ui/auth/login_screen.dart';
import 'package:shopping_app/ui/auth/signup_screen.dart';
import 'package:shopping_app/ui/home/home_screen.dart';
final routerConfig =  _buildRouter();


GoRouter _buildRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: Routes.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: Routes.signup,
        builder: (context, state) => SignupScreen(),
      ),
      GoRoute(
        path: Routes.forgotPassword,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );
}
