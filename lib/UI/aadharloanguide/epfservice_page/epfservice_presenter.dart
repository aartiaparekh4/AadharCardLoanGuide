import 'package:aadhar_card_loan_guide/Utils/rest_ds.dart';
import 'package:aadhar_card_loan_guide/models/epf_service_response.dart';

abstract class EPFServiceInterface {
  onSuccess(EPFServiceResponse ePFServiceResponse);
  onError(String msg);
}

class EPFServicePresenter {
  EPFServiceInterface _view;
  RestDatasource api = new RestDatasource();

  EPFServicePresenter(this._view);

  doEPFServiceData() {
    api.getEPFServicesResponse()
        .then((EPFServiceResponse ePFServiceResponse) {
        _view.onSuccess(ePFServiceResponse);
    }).catchError((Object error) => _view.onError("error"));
  }
}
