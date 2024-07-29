
import 'dart:developer';

import 'package:e_courier_360/data/models/receiver.dart';
import 'package:e_courier_360/data/services/network_caller/network_caller.dart';
import 'package:e_courier_360/data/services/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';

import 'package:get/get.dart';

class ReceiverController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  
  List<Receiver> _receivers = [];
  List<Receiver> get receivers=>_receivers;

  Receiver getReceiverFromId(int receiverId)=>_receivers.where((receiver) => receiver.id==receiverId).toList().first;


  Future<bool> getReceivers() async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.receiverList,);
    _inProgress = false;
    if (response.success) {
      List<dynamic> data=response.returnValue;
     _receivers = data.map((receiverJson) => Receiver.fromJson(receiverJson)).toList();
      _receivers.sort((a, b) => a.name.compareTo(b.name));
      log(_receivers.toString());
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
    Receiver? _newReceiver;
    Receiver? get newReceiver=>_newReceiver;
  Future<bool> addReceiver(String name,String phone, String address ) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.receiverList,{
        "name": name,
        "email": '',
        "phone": phone,
        "address": address,
        "merchant": '1'
     },token: AuthController.token);
    _inProgress = false;
    if (response.success) {

      _newReceiver = Receiver.fromJson( response.returnValue);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
