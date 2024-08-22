
import 'package:e_courier_360/core/network_caller/network_caller.dart';
import 'package:e_courier_360/core/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/models/merchant_parcel_summary.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/global_loading.dart';

import 'package:get/get.dart';

class ParcelSummaryController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  
  late ParcelSummary parcelSummary;
  Future<bool> getMerchantParcelSummary(int merchantId) async {
    _inProgress = true;
    showloading('Loading..');
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.merchantParcelSummary(merchantId));
    _inProgress = false;
    if (response.success) {
      parcelSummary=ParcelSummary.fromJson(response.returnValue);
      update();
      showSuccess("success");
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      showError(response.errorMessage);
      return false;
    }
  }
  
  Future<bool> getRiderParcelSummary(int rid) async {
    _inProgress = true;
    showloading('Loading..');
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.riderParcelSummary(rid));
    _inProgress = false;
    if (response.success) {
      parcelSummary=ParcelSummary.fromJson(response.returnValue);
      update();
      showSuccess("success");
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      showError(response.errorMessage);
      return false;
    }
  }
  
}
