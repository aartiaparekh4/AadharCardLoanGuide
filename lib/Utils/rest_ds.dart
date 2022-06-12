import 'package:aadhar_card_loan_guide/models/apply_loan_response.dart';
import 'package:aadhar_card_loan_guide/models/loan_guide_response.dart';
import 'package:aadhar_card_loan_guide/models/typeof_loan_response.dart';

import 'network_util.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://aadhar-card-loan-guide.herokuapp.com/";

  static final APPLY_NOW_URL = BASE_URL + "api/aadhar-card-loan-guide-view";
  static final Types_of_Loan= BASE_URL + "api/loan-type-view";
  static final loan_guide_view= BASE_URL + "api/loan-guide-view";
  Future<ApplyLoanResponse> getApplyLoanData() {
    return _netUtil.get(
      APPLY_NOW_URL,
      {
      },
    ).then((dynamic res) {
      return ApplyLoanResponse.fromJson(res);
    });
  }
Future<TypeOfLoanResponse> getTypeOfResponseData() {
    return _netUtil.get(
      Types_of_Loan,
      {
      },
    ).then((dynamic res) {
      return TypeOfLoanResponse.fromJson(res);
    });
  }

  Future<LoanGuideResponse> getLoanGuideResponse() {
    return _netUtil.get(
      loan_guide_view,
      {
      },
    ).then((dynamic res) {
      return LoanGuideResponse.fromJson(res);
    });
  }
  }
