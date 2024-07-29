
import 'package:e_courier_360/data/models/pickup_zone.dart';
import 'package:e_courier_360/data/services/network_caller/network_caller.dart';
import 'package:e_courier_360/data/services/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:get/get.dart';

class PickUpZoneController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  
  List<PickupZone> _pickupZones = [];
  List<PickupZone> get pickupZones=>_pickupZones;
  PickupZone getPickupZoneById(int pickupZoneID)=>_pickupZones.where((pickZone) => pickZone.id==pickupZoneID).toList().first;
  List<PickupZone>? getPickupZoneListById(int pickupZoneID)=>_pickupZones.where((pickZone) => pickZone.id==pickupZoneID).toList();
  int getIdFromPickupZone(String pickupZoneName)=>_pickupZones.where((pickZone) => pickZone.name==pickupZoneName).toList().first.id;

  Future<bool> getPickupZone() async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.pickupZone,);
    _inProgress = false;
    if (response.success) {
     _pickupZones = (response.returnValue as List<dynamic>)
          .map((json) => PickupZone.fromJson(json))
          .toList();
     _pickupZones.sort((a, b) => a.name.compareTo(b.name));
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
