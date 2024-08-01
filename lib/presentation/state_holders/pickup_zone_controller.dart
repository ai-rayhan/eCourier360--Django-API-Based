
import 'package:e_courier_360/data/models/pickup_zone.dart';
import 'package:e_courier_360/data/services/network_caller/network_caller.dart';
import 'package:e_courier_360/data/services/network_caller/request_methods/put_request.dart';
import 'package:e_courier_360/data/services/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/global_loading.dart';
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

  Future<bool> getPickupZone({int? branchId}) async {
    _inProgress = true;
    showloading('Loading..');
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute("${Urls.pickupZone}?branch_id=$branchId",);
    _inProgress = false;
    if (response.success) {
     _pickupZones = (response.returnValue as List<dynamic>)
          .map((json) => PickupZone.fromJson(json))
          .toList();
     _pickupZones.sort((a, b) => a.name.compareTo(b.name));
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
  
  Future<bool> addPickupZone(String name,int branchId) async {
    showloading('Loading..');
    final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.pickupZone,token: AuthController.token, {
    "name":name ,
    "branch_id": branchId.toString(),
    });
    if (response.success) {
      await getPickupZone(branchId: branchId);
      showSuccess("success");
      return true;
    } else {
      showError(response.errorMessage);
      return false;
    }
  }
  Future<bool> updatePickupZone(String name,int branchId,int zoneId) async {
    showloading('Loading..');
    final  NetworkCallerReturnObject response =await PutRequest.execute(Urls.updatePickupZone(zoneId),token: AuthController.token, {
     "name":name ,
    "branch_id": branchId.toString(),
    });
    if (response.success) {
      await getPickupZone(branchId: branchId);
      return true;
    } else {
      showError(response.errorMessage);
      return false;
    }
  }
  // Future<bool> deleteBranch(int zoneId) async {
  //   showloading('Loading..');
  //   final  NetworkCallerReturnObject response =await DeleteRequest.execute(Urls.updatePickupZone(zoneId),token: AuthController.token);
  //   if (response.success) {
  //     await getPickupZone();
  //     return true;
  //   } else {
  //     showError(response.errorMessage);
  //     return false;
  //   }
  // }
}
