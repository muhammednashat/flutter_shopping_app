import 'package:go_router/go_router.dart';
import 'package:shopping_app/data/model/category.dart';
import 'package:shopping_app/data/model/product.dart';
import 'package:shopping_app/data/model/responses/cart_response.dart';
import 'package:shopping_app/data/model/responses/orders_response.dart';
import 'package:shopping_app/data/model/user.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/splash_screen.dart';
import 'package:shopping_app/ui/auth/forgot_password_screen.dart';
import 'package:shopping_app/ui/auth/login_screen.dart';
import 'package:shopping_app/ui/auth/signup_screen.dart';
import 'package:shopping_app/ui/orders/order_details.dart';
import 'package:shopping_app/ui/payment/check_out.dart';
import 'package:shopping_app/ui/display_products/display_all_products.dart';
import 'package:shopping_app/ui/display_products/display_product.dart';
import 'package:shopping_app/ui/main_screen.dart';
import 'package:shopping_app/ui/payment/success_screen.dart';
import 'package:shopping_app/ui/profile/change_password.dart';
import 'package:shopping_app/ui/profile/change_personal_info.dart';
import 'package:shopping_app/ui/profile/settings_screen.dart';
import 'package:shopping_app/ui/shop/display_categories_products.dart';

final routerConfig = _buildRouter();

GoRouter _buildRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: Routes.splashScreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(path: Routes.login, builder: (context, state) => LoginScreen()),
      GoRoute(path: Routes.signup, builder: (context, state) => SignupScreen()),

      GoRoute(
        path: Routes.checkOut,
        builder: (context, state) {
          final cartResponse = state.extra as CartResponse;
          return CheckOut(cartResponse: cartResponse);
        },
      ),
      GoRoute(
        path: Routes.successScreen,
        builder: (context, state) => SuccessScreen(),
      ),

      GoRoute(
        path: Routes.settings,
        builder: (context, state) {
          final user = state.extra as User;
          return SettingsScreen(user: user);
        },
      ),
      GoRoute(
        path: Routes.changePassword,
        builder: (context, state) => ChangePassword(),
      ),
      GoRoute(
        path: Routes.changePersonalInfo,
        builder: (context, state) => ChangePersonalInfo(),
      ),

      GoRoute(
        path: Routes.orderDetails,
        builder: (context, state) {
          final order = state.extra as OrdersResponse;
          return OrderDetails(order: order);
        },
      ),
      GoRoute(
        path: Routes.forgotPassword,
        builder: (context, state) => ForgotPasswordScreen(),
      ),
      GoRoute(
        path: Routes.mainScreen,
        builder: (context, state) => MainScreen(),
      ),

      GoRoute(
        path: Routes.displayProduct,
        builder: (context, state) {
          final product = state.extra as Product;
          return DisplayProdcut(product: product);
        },
      ),

      GoRoute(
        path: Routes.displayCategoryProducts,
        builder: (context, state) {
          final category = state.extra as Category;
          return DisplayCategoriesProducts(category: category);
        },
      ),

      GoRoute(
        path: Routes.displayAllProducts,
        builder: (context, state) {
          final data = state.extra as Map<String, Object>;
          final title = data['title'] as String;
          final products = data['products'] as List<Product>;

          return DisplayAllProducts(title: title, products: products);
        },
      ),
    ],
  );
}
