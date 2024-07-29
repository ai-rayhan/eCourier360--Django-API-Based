
import 'package:e_courier_360/data/models/delivery_zone.dart';
import 'package:e_courier_360/data/services/network_caller/network_caller.dart';
import 'package:e_courier_360/data/services/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:get/get.dart';

class DeliveryZoneController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  
  List<DeliveryZone> _deliveryZones = [];
  List<DeliveryZone> get deliveryZones=>_deliveryZones;

  DeliveryZone getDeliveryZoneFromId(int deliveryZoneID)=>_deliveryZones.where((delZone) => delZone.id==deliveryZoneID).toList().first;
  
  Future<bool> getDeliveryZone() async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.deliveryZone,);
    _inProgress = false;
    if (response.success) {
     _deliveryZones = (response.returnValue as List<dynamic>)
          .map((json) => DeliveryZone.fromJson(json))
          .toList();
     _deliveryZones.sort((a, b) => a.name.compareTo(b.name));
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
