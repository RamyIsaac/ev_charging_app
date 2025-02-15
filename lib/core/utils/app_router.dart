import 'package:ev_charging/features/auth/presentation/login_view.dart';
import 'package:ev_charging/features/auth/presentation/signup_view.dart';
import 'package:ev_charging/features/enRoute/presentation/en_route_view.dart';
import 'package:ev_charging/features/favourite/presentation/favourite_view.dart';
import 'package:ev_charging/features/home/presentation/home_view.dart';
import 'package:ev_charging/features/profile/presentation/edit_profile_view.dart';
import 'package:ev_charging/features/profile/presentation/my_booking_view.dart';
import 'package:ev_charging/features/profile/presentation/profile_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kSignupView = '/signupView';
  static const kHomeView = '/homeView';
  static const kProfileView = '/homeView/profileView';
  static const kFavouriteView = '/homeView/favouriteView';
  static const kEnRoteView = '/homeView/enRouteView';
  static const kEditProfileView = '/homeView/profileView/editProfileView';
  static const kMyBokingsView = '/homeView/profileView/myBookingView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kSignupView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kEnRoteView,
        builder: (context, state) => const EnRouteView(),
      ),
      GoRoute(
        path: kFavouriteView,
        builder: (context, state) => const FavouriteView(),
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: kMyBokingsView,
        builder: (context, state) => const MyBookingView(),
      ),
    ],
  );
}
