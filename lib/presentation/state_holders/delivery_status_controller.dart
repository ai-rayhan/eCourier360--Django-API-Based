
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
  

  List<String> get statusNames =>deliveryStatuses.map((status) => status.status).toList();
  List<int> get statusIds =>deliveryStatuses.map((status) => status.id).toList();
  List<int> get statusCount =>deliveryStatuses.map((status) => status.parcelCount??0).toList();
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

  // List<DeliveryStatus> _dsParcels = [];
  // List<DeliveryStatus> get dsParcels=>_dsParcels;
  // List<String> get dsName =>dsParcels.map((status) => status.status).toList();
  // List<int> get dsIds =>dsParcels.map((status) => status.id).toList();
  // Future<bool> getDSParcelCount() async {
  //   _inProgress = true;
  //   update();
  //    final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.dsParcelCount,);
  //    log(response.responseCode.toString());
  //   _inProgress = false;
  //   if (response.success) {
  //    _dsParcels = (response.returnValue as List<dynamic>)
  //         .map((json) => DeliveryStatus.fromJson(json))
  //         .toList();
  //    _dsParcels.sort((a, b) => a.id.compareTo(b.id));
  //     update();
  //     return true;
  //   } else {
  //     _errorMessage = response.errorMessage;
  //     update();
  //     return false;
  //   }
  // }

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
    1: [statusID,2, 11],
    2: [statusID,3, 11],
    3: [statusID,4, 11],
    4: [statusID,5, 11],
    5: [statusID,6, 7, 8, 9, 11],
    8:[statusID,12],
    9:[statusID,12],
    11:[statusID,12],
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
