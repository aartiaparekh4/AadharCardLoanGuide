import 'package:aadhar_card_loan_guide/Utils/rest_ds.dart';
import 'package:aadhar_card_loan_guide/models/loan_guide_response.dart';

abstract class LoanGuideInterface {
  onSuccess(LoanGuideResponse loanGuideResponse);
  onError(String msg);
}

class LoanGuidePresenter {
  LoanGuideInterface _view;
  RestDatasource api = new RestDatasource();

  LoanGuidePresenter(this._view);

  doLoanGuideData() {
    api.getLoanGuideResponse()
        .then((LoanGuideResponse loanGuideResponse) {
        _view.onSuccess(loanGuideResponse);
    }).catchError((Object error) => _view.onError("error"));
  }
}
