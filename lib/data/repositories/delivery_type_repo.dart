import 'package:e_courier_360/core/network_caller/network_caller.dart';
import 'package:e_courier_360/core/network_caller/request_methods/dynamic_post_request.dart';
import 'package:e_courier_360/core/network_caller/request_methods/dynamic_put_request.dart';
import 'package:e_courier_360/core/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/models/delivery_type_info.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';

class DeliveryTypeInfoRepo {
 Future<NetworkCallerReturnObject> getDeliveryType()async{
      final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.deliveryType,token: AuthController.token);
      return response;
  }
 Future<NetworkCallerReturnObject> addDeliveryType(DeliveryInfo deliveryInfo)async{
      final  NetworkCallerReturnObject response =await DynamicPostRequest.execute(Urls.deliveryType,token: AuthController.token, deliveryInfo.toJson());
      return response;
  }
 Future<NetworkCallerReturnObject> updateDeliveryType(DeliveryInfo deliveryInfo,int deliveryTypeId)async{
      final  NetworkCallerReturnObject response =await DynamicPutRequest.execute(Urls.updateDeliveryType(deliveryTypeId),token: AuthController.token,deliveryInfo.toJson());
      return response;
  }
}