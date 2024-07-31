import 'package:e_courier_360/data/models/branch.dart';
import 'package:e_courier_360/data/models/product.dart';
import 'package:e_courier_360/data/services/network_caller/request_methods/get_request.dart';
import 'package:e_courier_360/data/services/network_caller/request_methods/post_request.dart';
import 'package:e_courier_360/data/services/network_caller/request_methods/put_request.dart';
import 'package:e_courier_360/data/services/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<Branch> _branches = [];
  List<Branch> get branches=>_branches;

  Future<bool> getBranches() async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.branch,);
    _inProgress = false;
    if (response.success) {
     _branches = (response.returnValue as List<dynamic>)
          .map((json) => Branch.fromJson(json))
          .toList();
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

  Future<bool> addProduct(List<Product> productList,int parcelId) async {
    _inProgress = true;
    update();
    for(Product product in productList){
    
    final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.addParcelDetails,token: AuthController.token, {
    "date": "2024-04-17" ,
    "parcel": parcelId.toString() ,
    "product_type":product.productType.toString(),
    "item_description": product.description??'',
    "quantity": product.quantity.toString(),
    "weight": product.weight.toString(),
    "width": product.width.toString(),
    "height": product.height.toString(),
    }, isLogin: true);
    response.returnValue;
    }
    return true;
  }

  Future<bool> updateProduct(List<Product> productList,int parcelId) async {
    _inProgress = true;
    update();
    for(Product product in productList){
    
    final  NetworkCallerReturnObject response =await PutRequest.execute(Urls.updateParcelDetails(product.id),token: AuthController.token, {
    "date": "2024-04-17" ,
    "parcel": parcelId.toString() ,
    "product_type":product.productType.toString(),
    "item_description": product.description??'',
    "quantity": product.quantity.toString(),
    "weight": product.weight.toString(),
    "width": product.width.toString(),
    "height": product.height.toString(),
    }, isLogin: true);
    response.returnValue;
    }
    return true;
  }
}