import 'package:aadhar_card_loan_guide/Utils/rest_ds.dart';
import 'package:aadhar_card_loan_guide/models/bank_info_response.dart';

abstract class BankInfoInterface {
  onSuccess(BankInfoResponse bankInfoResponse);
  onError(String msg);
}

class BankInfoPresenter {
  BankInfoInterface _view;
  RestDatasource api = new RestDatasource();

  BankInfoPresenter(this._view);

  doBankInfoData() {
    api.getBankInfoResponse().then((BankInfoResponse bankInfoResponse) {
      _view.onSuccess(bankInfoResponse);
    }).catchError((Object error) => _view.onError("error"));
  }
}
