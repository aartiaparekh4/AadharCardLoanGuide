// ignore_for_file: prefer_final_fields

import 'package:aadhar_card_loan_guide/Utils/rest_ds.dart';
import 'package:aadhar_card_loan_guide/models/apply_loan_response.dart';

abstract class ApplyLoanInterface {
  onSuccess(ApplyLoanResponse applyLoanResponse);
  onError(String msg);
}

class ApplyLoanPresenter {
  ApplyLoanInterface _view;
  RestDatasource api =  RestDatasource();

  ApplyLoanPresenter(this._view);

  doApplyLoan() {
    api.getApplyLoanData()
        .then((ApplyLoanResponse applyLoanResponse) {
        _view.onSuccess(applyLoanResponse);
    }).catchError((Object error) => _view.onError("error"));
  }
}
