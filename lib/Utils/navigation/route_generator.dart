import 'package:aadhar_card_loan_guide/UI/aadharloanguide/adharloanguide_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/applynow/applynow_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/loanType/loantype_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/loanguide_page/loanguide_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/typeofloan/typeloan_page.dart';
import 'package:flutter/material.dart';

import '../../UI/home_page/home_page.dart';
import '../../UI/welcome_page/welcome_page.dart';
import 'routes.dart';

Route<Object>? generateRoute(RouteSettings settings) {
  debugPrint('\n=============== >> Navigating to: ${settings.name}\n');
  final args = settings.arguments;

  switch (settings.name) {
    case Routes.root:
      return _buildRoute(settings: settings, screen: const WelcomePage());
    case Routes.home:
      return _buildRoute(settings: settings, screen: const HomePage());
      case Routes.adharloanguide:
       return _buildRoute(settings: settings, screen: const AdharLoanGuidePage());
    case Routes.applyNowPage:
       return _buildRoute(settings: settings, screen: ApplyNowPage());
       case Routes.typeLoanPage:
       return _buildRoute(settings: settings, screen: TypeLoanPage());
       case Routes.loanguidepage:
       return _buildRoute(settings: settings, screen: LoanGuidePage());
    case Routes.loanTypepage:
      return _buildRoute(settings: settings, screen: LoanTypePage());
    default:
      return _errorRoute();
  }
}

Route<Object>? _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('ERROR'),
      ),
    );
  });
}

Route<Object>? _buildRoute(
    {required RouteSettings settings, required Widget screen}) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) {
      return screen;
    },
  );
}

MaterialPageRoute _buildNoAnimationRoute(
        {required RouteSettings settings, required Widget screen}) =>
    NoAnimationMaterialPageRoute(
      settings: settings,
      builder: (context) {
        return screen;
      },
    );

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
            builder: builder,
            maintainState: maintainState,
            settings: settings,
            fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}

class FadePageRoute<T> extends PageRoute<T> {
  final Widget child;

  FadePageRoute(this.child);

  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => '';

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 700);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
