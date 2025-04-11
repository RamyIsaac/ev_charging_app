import 'package:ev_charging/features/auth/presentation/views/login_view.dart';
import 'package:ev_charging/features/auth/presentation/views/signup_view.dart';
import 'package:ev_charging/features/enRoute/presentation/views/en_route_view.dart';
import 'package:ev_charging/features/payment/presentation/views/book_slot_view.dart';
import 'package:ev_charging/features/favourite/presentation/views/favourite_view.dart';
import 'package:ev_charging/features/favourite/presentation/views/station_details_view.dart';
import 'package:ev_charging/features/home/presentation/views/home_view.dart';
import 'package:ev_charging/features/payment/presentation/views/make_payment_view.dart';
import 'package:ev_charging/features/profile/presentation/FAQS_view.dart';
import 'package:ev_charging/features/profile/presentation/views/edit_profile_view.dart';
import 'package:ev_charging/features/profile/presentation/views/my_booking_view.dart';
import 'package:ev_charging/features/profile/presentation/views/privacy_policy_view.dart';
import 'package:ev_charging/features/profile/presentation/views/profile_view.dart';
import 'package:ev_charging/features/profile/presentation/views/terms_and_conditions_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kSignupView = '/signupView';

  //Bottom Navigation Bar views
  static const kHomeView = '/homeView';
  static const kProfileView = '/homeView/profileView';
  static const kFavouriteView = '/homeView/favouriteView';
  static const kEnRoteView = '/homeView/enRouteView';

  //profile feature views

  static const kEditProfileView = '/homeView/profileView/editProfileView';
  static const kMyBokingsView = '/homeView/profileView/myBookingView';
  static const kTermsAndConditionsView =
      '/homeView/profileView/termsAndConditionsView';
  static const kFAQsView = '/homeView/profileView/faqsView';
  static const kPrivacyPolicyView = '/homeView/profileView/privacyPolicyView';
  //favourite feature views
  static const kStationDetailsView = '/favouriteView/stationDetailsView';
  static const kBookingDetailsView =
      '/favouriteView/stationDetailsView/bookingDetailsView';

  //Payment feature views
  static const kMakePaymentView =
      '/favouriteView/stationDetailsView/bookingDetailsView/makePaymentView';
  static final router = GoRouter(
    routes: [
      // auth feature views
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kSignupView,
        builder: (context, state) => const SignupView(),
      ),

      //Bottom Navigation Bar views
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

      // Profile feature views

      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => const EditProfileView(),
      ),
      GoRoute(
        path: kMyBokingsView,
        builder: (context, state) => const MyBookingView(),
      ),
      GoRoute(
        path: kTermsAndConditionsView,
        builder: (context, state) => const TermsAndConditionsView(),
      ),
      GoRoute(
        path: kFAQsView,
        builder: (context, state) => const FAQsView(),
      ),
      GoRoute(
        path: kPrivacyPolicyView,
        builder: (context, state) => const PrivacyPolicyView(),
      ),

      //favourite feature views
      GoRoute(
          path: kStationDetailsView,
          builder: (context, state) => const StationDetailsView()),

      GoRoute(
          path: kBookingDetailsView,
          builder: (context, state) => const BookSlotView()),

      //payment feature views
      GoRoute(
          path: kMakePaymentView,
          builder: (context, state) => const MakePaymentView()),
    ],
  );
}
