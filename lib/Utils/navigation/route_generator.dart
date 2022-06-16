// ignore_for_file: unused_element

import 'package:aadhar_card_loan_guide/UI/aadharloanguide/adharloanguide_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/applynow/apply_details_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/applynow/applynow_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/bankholiday_page/bankholiday_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/bankinfo_page/bankdetail_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/bankinfo_page/bankinfo_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/banklist/bank_details_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/banklist/banklist_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/epfservice_page/epfservice_details_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/epfservice_page/epfservice_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/loanType/loantype_details_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/loanType/loantype_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/loanguide_page/loanguide_details_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/loanguide_page/loanguide_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/typeofloan/typeloan_page.dart';
import 'package:aadhar_card_loan_guide/UI/aadharloanguide/typeofloan/typeofloan_details_page.dart';
import 'package:flutter/material.dart';

import '../../UI/home_page/home_page.dart';
import '../../UI/welcome_page/welcome_page.dart';
import 'routes.dart';

Route<Object>? generateRoute(RouteSettings settings) {
  // final args = settings.arguments;
  switch (settings.name) {
    case Routes.root:
      return _buildRoute(settings: settings, screen: WelcomePage());
    case Routes.home:
      return _buildRoute(settings: settings, screen: HomePage());
    case Routes.adharloanguide:
      return _buildRoute(settings: settings, screen: AdharLoanGuidePage());
    case Routes.applyNowPage:
      return _buildRoute(settings: settings, screen: ApplyNowPage());
    case Routes.typeLoanPage:
      return _buildRoute(settings: settings, screen: TypeLoanPage());
    case Routes.loanguidepage:
      return _buildRoute(settings: settings, screen: LoanGuidePage());
    case Routes.loanTypepage:
      return _buildRoute(settings: settings, screen: LoanTypePage());
    case Routes.applyDetailsPage:
      final args = settings.arguments as ApplyDetailsPage;
      return _buildRoute(settings: settings, screen: ApplyDetailsPage(title: args.title, answer: args.answer));
    case Routes.bankListPage:
      return _buildRoute(settings: settings, screen: BankListPage());
    case Routes.bankDetailsPage:
      final args = settings.arguments as BankDetailsPage;
      return _buildRoute(
          settings: settings,
          screen: BankDetailsPage(
            bankListData: args.bankListData,
          ));
    case Routes.typeofLoanDetailsPage:
      final args = settings.arguments as TypeofLoanDetailsPage;
      return _buildRoute(
          settings: settings,
          screen: TypeofLoanDetailsPage(
            description: args.description,
          ));
    case Routes.bankHolidayPage:
      return _buildRoute(settings: settings, screen: BankHolidayPage());
    case Routes.bankInfoPage:
      return _buildRoute(settings: settings, screen: BankInfoPage());
    case Routes.bankDetailPage:
      final args = settings.arguments as BankDetailPage;
      return _buildRoute(
          settings: settings,
          screen: BankDetailPage(
            bankListData: args.bankListData,
          ));
    case Routes.loanTypeDetailsPage:
      final args = settings.arguments as LoanTypeDetailsPage;
      return _buildRoute(
          settings: settings,
          screen: LoanTypeDetailsPage(
            dataTypeloan: args.dataTypeloan,
          ));
    case Routes.epfServicePage:
      return _buildRoute(settings: settings, screen: EPFServicePage());
    case Routes.epfServiceDetailsPage:
      final args = settings.arguments as EPFServiceDetailsPage;
      return _buildRoute(
          settings: settings,
          screen: EPFServiceDetailsPage(
            ePFServiceData: args.ePFServiceData,
          ));
    case Routes.loanguidedetailspage:
      final args = settings.arguments as LoanGuideDetailsPage;
      return _buildRoute(
          settings: settings,
          screen: LoanGuideDetailsPage(
            guideData: args.guideData,
          ));
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

Route<Object>? _buildRoute({required RouteSettings settings, required Widget screen}) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) {
      return screen;
    },
  );
}

MaterialPageRoute _buildNoAnimationRoute({required RouteSettings settings, required Widget screen}) => NoAnimationMaterialPageRoute(
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
  }) : super(builder: builder, maintainState: maintainState, settings: settings, fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
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
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
