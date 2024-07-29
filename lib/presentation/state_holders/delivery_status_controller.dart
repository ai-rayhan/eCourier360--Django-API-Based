
import 'dart:developer';

import 'package:e_courier_360/data/models/delivery_status.dart';
import 'package:e_courier_360/data/services/network_caller/network_caller.dart';
import 'package:e_courier_360/data/services/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:get/get.dart';

class DeliveryStatusController extends GetxController {
  bool _inProgress = true;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  
  List<DeliveryStatus> _deliveryStatuses = [];
  List<DeliveryStatus> get deliveryStatuses=>_deliveryStatuses;
  List<int> get statusCount =>_deliveryStatuses.map((status) => status.totalBooking??0).toList();

  List<String> get statusNames =>deliveryStatuses.map((status) => status.status).toList();
  List<int> get statusIds =>deliveryStatuses.map((status) => status.id).toList();
  DeliveryStatus  deliveryStatus (int id) =>deliveryStatuses.where((status) => status.id==id).toList().first;
  Future<bool> getDeliveryStatus() async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.deliveryStatus,);
     log(response.responseCode.toString());
    _inProgress = false;
    if (response.success) {
     _deliveryStatuses = (response.returnValue as List<dynamic>)
          .map((json) => DeliveryStatus.fromJson(json))
          .toList();
     _deliveryStatuses.sort((a, b) => a.id.compareTo(b.id));
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

int _tabindex=0;
int get tabindex=>_tabindex;
set tabIndex(int index){
  _tabindex=index;
  update();
}

}
