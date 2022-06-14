// ignore_for_file: prefer_final_fields

import 'package:aadhar_card_loan_guide/Utils/rest_ds.dart';
import 'package:aadhar_card_loan_guide/models/banklist_response.dart';

abstract class BankListInterface {
  onSuccess(BankListResponse bankListResponse);
  onError(String msg);
}

class BankListPresenter {
  BankListInterface _view;
  RestDatasource api =  RestDatasource();

  BankListPresenter(this._view);

  doBankListData() {
    api.getBankListResponse()
        .then((BankListResponse bankListResponse) {
        _view.onSuccess(bankListResponse);
    }).catchError((Object error) => _view.onError("error"));
  }
}
