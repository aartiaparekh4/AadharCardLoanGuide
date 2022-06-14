import 'package:aadhar_card_loan_guide/Utils/rest_ds.dart';
import 'package:aadhar_card_loan_guide/models/typeof_loan_response.dart';

abstract class TypeofLoanInterface {
  onSuccess(TypeOfLoanResponse typeOfLoanResponse);
  onError(String msg);
}

class TypeofLoanPresenter {
  TypeofLoanInterface _view;
  RestDatasource api = new RestDatasource();

  TypeofLoanPresenter(this._view);

  doTypeLoanData() {
    api.getTypeOfResponseData()
        .then((TypeOfLoanResponse typeOfLoanResponse) {
        _view.onSuccess(typeOfLoanResponse);
    }).catchError((Object error) => _view.onError("error"));
  }
}
