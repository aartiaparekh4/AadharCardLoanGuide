import 'package:aadhar_card_loan_guide/models/apply_loan_response.dart';
import 'package:aadhar_card_loan_guide/models/bank_holiday_response.dart';
import 'package:aadhar_card_loan_guide/models/bank_info_response.dart';
import 'package:aadhar_card_loan_guide/models/banklist_response.dart';
import 'package:aadhar_card_loan_guide/models/device_fcm_response.dart';
import 'package:aadhar_card_loan_guide/models/epf_service_response.dart';
import 'package:aadhar_card_loan_guide/models/loan_guide_response.dart';
import 'package:aadhar_card_loan_guide/models/typeof_loan_response.dart';

import 'network_util.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://aadhar-card-loan-guide.herokuapp.com/";

  static final APPLY_NOW_URL = BASE_URL + "api/aadhar-card-loan-guide-view";
  static final Types_of_Loan = BASE_URL + "api/loan-type-view";
  static final loan_guide_view = BASE_URL + "api/loan-guide-view";
  static final BANK_LIST_URL = BASE_URL + "api/bank-list-view";
  static final Bank_holiday = BASE_URL + "api/bank-holiday-view";
  static final Bank_info = BASE_URL + "api/bank-list-view";
  static final Device_fcm = BASE_URL + "api/device/fcm/";
  static final EPF_service = BASE_URL + "api/EPF-Service-view";

  //Calling the apply loan API
  Future<ApplyLoanResponse> getApplyLoanData() {
    return _netUtil.get(
      APPLY_NOW_URL,
      {},
    ).then((dynamic res) {
      return ApplyLoanResponse.fromJson(res);
    });
  }

  //Calling the Type of loan API
  Future<TypeOfLoanResponse> getTypeOfResponseData() {
    return _netUtil.get(
      Types_of_Loan,
      {},
    ).then((dynamic res) {
      return TypeOfLoanResponse.fromJson(res);
    });
  }

  //Calling the Loan Guide API
  Future<LoanGuideResponse> getLoanGuideResponse() {
    return _netUtil.getLang(
      loan_guide_view,
      {},
    ).then((dynamic res) {
      return LoanGuideResponse.fromJson(res);
    });
  }

  //Calling the Bank List API
  Future<BankListResponse> getBankListResponse() {
    return _netUtil.get(
      BANK_LIST_URL,
      {},
    ).then((dynamic res) {
      return BankListResponse.fromJson(res);
    });
  }

  //Calling the Bank List API
  Future<BankListResponse> getEPFServiceResponse() {
    return _netUtil.get(
      BANK_LIST_URL,
      {},
    ).then((dynamic res) {
      return BankListResponse.fromJson(res);
    });
  }

  //Calling the Bank holiday API
  Future<BankHolidayResponse> getBankHolidayResponse() {
    return _netUtil.get(
      Bank_holiday,
      {},
    ).then((dynamic res) {
      return BankHolidayResponse.fromJson(res);
    });
  }

  //Calling the Bank info API
  Future<BankInfoResponse> getBankInfoResponse() {
    return _netUtil.get(
      Bank_info,
      {},
    ).then((dynamic res) {
      return BankInfoResponse.fromJson(res);
    });
  }

  //Calling the device fcm API
  Future<DeviceFcmResponse> getDeviceFcmResponse(String fcmToken) {
    return _netUtil.post(
      Device_fcm,
      {"registration_id": fcmToken, "device_id": "1", "active": "true"}
    ).then((dynamic res) {
      return DeviceFcmResponse.fromJson(res);
    });
  }

  //Calling the EPF Service API
  Future<EPFServiceResponse> getEPFServicesResponse() {
    return _netUtil.get(
      EPF_service,
      {},
    ).then((dynamic res) {
      return EPFServiceResponse.fromJson(res);
    });
  }
}
