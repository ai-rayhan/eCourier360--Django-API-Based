
import 'package:e_courier_360/data/models/payment.dart';
import 'package:e_courier_360/data/services/network_caller/network_caller.dart';
import 'package:e_courier_360/data/services/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/global_loading.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  
  List<Payment> _paymentList = [];
  List<Payment> get paymentList=>_paymentList;

  Future<bool> getMerchantPaymentList({int? branchId}) async {
    _inProgress = true;
    showloading('Loading..');
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.merchantPaymentHistory(AuthController.mcid));
    _inProgress = false;
    if (response.success) {
     _paymentList = (response.returnValue as List<dynamic>)
          .map((json) => Payment.fromJson(json))
          .toList();
     _paymentList.sort((a, b) => a.date.compareTo(b.date));
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
