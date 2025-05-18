import 'package:ev_charging/core/entities/station_entity.dart';
import 'package:ev_charging/core/services/location_service.dart';
import 'package:ev_charging/core/services/routes_service.dart';
import 'package:ev_charging/features/auth/presentation/views/sign_in_view.dart';
import 'package:ev_charging/features/auth/presentation/views/sign_up_view.dart';
import 'package:ev_charging/features/enRoute/presentation/views/en_route_view.dart';
import 'package:ev_charging/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:ev_charging/features/payment/presentation/views/book_slot_view.dart';
import 'package:ev_charging/features/favourite/presentation/views/favourite_view.dart';
import 'package:ev_charging/core/widgets/station_details_view.dart';
import 'package:ev_charging/features/home/presentation/views/home_view.dart';
import 'package:ev_charging/features/payment/presentation/views/thank_you_view.dart';
import 'package:ev_charging/features/profile/presentation/views/edit_profile_view.dart';
import 'package:ev_charging/features/profile/presentation/views/faqs_view.dart';
import 'package:ev_charging/features/profile/presentation/views/my_booking_view.dart';
import 'package:ev_charging/features/profile/presentation/views/privacy_policy_view.dart';
import 'package:ev_charging/features/profile/presentation/views/profile_view.dart';
import 'package:ev_charging/features/profile/presentation/views/terms_and_conditions_view.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AppRouter {
  static const kOnBoardingView = '/';
  //auth feature views
  static const kSignUpView = '/signupView';
  static const kSignInView = '/signinView';

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
  static const kThankYouView =
      '/favouriteView/stationDetailsView/bookingDetailsView/thankYouView';

  static final router = GoRouter(
    routes: [
      // auth feature views

      GoRoute(
        path: kSignInView,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignUpView(),
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

      // favourite feature views
      GoRoute(
        path: AppRouter.kStationDetailsView,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>;

          final station = extra['station'] as StationEntity;
          final locationService = extra['locationService'] as LocationService;
          final routeService = extra['routeService'] as RoutesService;
          final onRouteUpdated =
              extra['onRouteUpdated'] as Function(Set<Polyline>);

          return StationDetailsView(
            station: station,
            locationService: locationService,
            routeService: routeService,
            onRouteUpdated: onRouteUpdated,
          );
        },
      ),

      // GoRoute(
      //   path: kStationDetailsView,
      //   builder: (context, state) {
      //     final station = state.extra as StationEntity;
      //     return StationDetailsView(station: station);
      //   },
      // ),

      GoRoute(
          path: kBookingDetailsView,
          builder: (context, state) => const BookSlotView()),

      //payment feature views
      GoRoute(
          path: kThankYouView,
          builder: (context, state) => const ThankYouView()),
//on_boarding feature views
      GoRoute(
          path: kOnBoardingView,
          builder: (context, state) => const OnBoardingView()),
    ],
  );
}
