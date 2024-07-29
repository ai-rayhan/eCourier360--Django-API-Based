
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


List<DeliveryStatus> updateStatusList = [];
List<int> get updateStatusIds  =>updateStatusList.map((status) => status.id).toList();
List<String> get updateStatusNames =>updateStatusList.map((status) => status.status).toList();

void reduceDeliveryStatusForUpdate(int statusID) {
  // Define a mapping from statusID to the list of desired delivery status IDs
  final statusMapping = {
    1: [statusID,2, 12],
    2: [statusID,3, 12],
    3: [statusID,4, 12],
    4: [statusID,5, 12],
    5: [statusID,6, 7, 8, 9, 10, 12],
    8:[statusID,13],
    9:[statusID,13],
    11:[statusID,13],
  };

  // Clear the existing list
  updateStatusList.clear();

  // Check if the statusID has a corresponding list in the mapping
  if (statusMapping.containsKey(statusID)) {
    // Get the list of desired delivery status IDs
    List<int> desiredStatusIds = statusMapping[statusID]!; 
    log(desiredStatusIds.toString());
    // Add the matching DeliveryStatus objects to the updateStatusList
    for (int id in desiredStatusIds) {
      DeliveryStatus? status = _findDeliveryStatusById(id);
      if (status != null) {
        updateStatusList.add(status);
      }
    }
  }
}
DeliveryStatus? _findDeliveryStatusById(int id) {
  try {
    return _deliveryStatuses.firstWhere(
      (element) => element.id == id,
    );
  } catch (e) {
    return null;
  }
}

}
