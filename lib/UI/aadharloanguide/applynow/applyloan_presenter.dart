import 'package:aadhar_card_loan_guide/Utils/rest_ds.dart';
import 'package:aadhar_card_loan_guide/models/apply_loan_response.dart';

abstract class ApplyLoanInterface {
  onSuccess(ApplyLoanResponse applyLoanResponse);
  onError(String msg);
}

class ApplyLoanPresenter {
  ApplyLoanInterface _view;
  RestDatasource api = new RestDatasource();

  ApplyLoanPresenter(this._view);

  doApplyLoan() {
    api.getApplyLoanData()
        .then((ApplyLoanResponse applyLoanResponse) {
    //  if (applyLoanResponse.status == 200) {
        _view.onSuccess(applyLoanResponse);
     // }else if(applyLoanResponse.status == 400)
        /*{
          _view.onError(applyLoanResponse.message,user.status);
        }
      else {
        _view.onError(user.message,user.status);
      }*/
    }).catchError((Object error) => _view.onError("error"));
  }
}
