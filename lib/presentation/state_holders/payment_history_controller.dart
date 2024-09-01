
import 'package:e_courier_360/data/models/merchant_settlement.dart';
import 'package:e_courier_360/core/network_caller/network_caller.dart';
import 'package:e_courier_360/core/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/models/rider_settlement.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/global_loading.dart';
import 'package:get/get.dart';

class PaymentHistoryController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  
  List<MerchantSettlement> _merchantSettlements = [];
  List<MerchantSettlement> get merchantSettlements=>_merchantSettlements;

  List<RiderSettlement> _riderSettlements = [];
  List<RiderSettlement> get riderSettlements=>_riderSettlements;

  Future<bool> getMerchantSettlement({int? branchId}) async {
    _inProgress = true;
    showloading('Loading..');
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.adminMerchantPaymentHistory);
    _inProgress = false;
    if (response.success) {
     _merchantSettlements = (response.returnValue as List<dynamic>)
          .map((json) => MerchantSettlement.fromJson(json))
          .toList();
     _merchantSettlements.sort((a, b) => a.id.compareTo(b.id));
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

  Future<bool> getRiderSettlement({int? branchId}) async {
    _inProgress = true;
    showloading('Loading..');
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.riderPaymentHistory,);
    _inProgress = false;
    if (response.success) {
     _riderSettlements = (response.returnValue as List<dynamic>)
          .map((json) => RiderSettlement.fromJson(json))
          .toList();
     _riderSettlements.sort((a, b) => a.id.compareTo(b.id));
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
