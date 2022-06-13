import 'dart:convert';
import 'package:aadhar_card_loan_guide/models/apply_loan_response.dart';
import 'package:aadhar_card_loan_guide/models/banklist_response.dart';
import 'package:aadhar_card_loan_guide/models/loan_guide_response.dart';
import 'package:aadhar_card_loan_guide/models/typeof_loan_response.dart';

import 'network_util.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://aadhar-card-loan-guide.herokuapp.com/";

  static final APPLY_NOW_URL = BASE_URL + "api/aadhar-card-loan-guide-view";
  static final Types_of_Loan= BASE_URL + "api/loan-type-view";
  static final loan_guide_view= BASE_URL + "api/loan-guide-view";
  static final BANK_LIST_URL= BASE_URL + "api/bank-list-view";

  //Calling the apply loan API
  Future<ApplyLoanResponse> getApplyLoanData() {
    return _netUtil.get(
      APPLY_NOW_URL,
      {
      },
    ).then((dynamic res) {
      return ApplyLoanResponse.fromJson(res);
    });
  }
  //Calling the Type of loan API
Future<TypeOfLoanResponse> getTypeOfResponseData() {
    return _netUtil.get(
      Types_of_Loan,
      {
      },
    ).then((dynamic res) {
      return TypeOfLoanResponse.fromJson(res);
    });
  }

  //Calling the Loan Guide API
  Future<LoanGuideResponse> getLoanGuideResponse() {
    return _netUtil.getLang(
      loan_guide_view,
      {
      },
    ).then((dynamic res) {
      return LoanGuideResponse.fromJson(res);
    });
  }

  //Calling the Bank List API
  Future<BankListResponse> getBankListResponse() {
    return _netUtil.get(
      BANK_LIST_URL,
      {
      },
    ).then((dynamic res) {
      return BankListResponse.fromJson(res);
    });
  }

  //Calling the Bank List API
  Future<BankListResponse> getEPFServiceResponse() {
    return _netUtil.get(
      BANK_LIST_URL,
      {
      },
    ).then((dynamic res) {
      return BankListResponse.fromJson(res);
    });
  }
  }
