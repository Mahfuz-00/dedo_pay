import 'package:flutter/material.dart';
import '../../Presentation/Screens/claim_form.dart';
import '../../Presentation/Screens/claim_tracking.dart';
import '../../Presentation/Screens/log_in.dart';

class AppRoutes {
  static const String login = '/login';
  static const String claimTracking = '/claim-tracking';
  static const String claimForm = '/claim-form';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case claimTracking:
        return MaterialPageRoute(builder: (_) => const ClaimTrackingPage());
      case claimForm:
        return MaterialPageRoute(builder: (_) => const ClaimFormPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}