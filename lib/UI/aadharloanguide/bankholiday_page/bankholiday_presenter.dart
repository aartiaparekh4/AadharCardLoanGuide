// ignore_for_file: prefer_final_fields

import 'package:aadhar_card_loan_guide/Utils/rest_ds.dart';
import 'package:aadhar_card_loan_guide/models/bank_holiday_response.dart';

abstract class BankHolidayInterface {
  onSuccess(BankHolidayResponse bankHolidayResponse);
  onError(String msg);
}

class BankHolidayPresenter {
  BankHolidayInterface _view;
  RestDatasource api =  RestDatasource();

  BankHolidayPresenter(this._view);

  doBankHolidayData() {
    api.getBankHolidayResponse()
        .then((BankHolidayResponse bankHolidayResponse) {
        _view.onSuccess(bankHolidayResponse);
    }).catchError((Object error) => _view.onError("error"));
  }
}
