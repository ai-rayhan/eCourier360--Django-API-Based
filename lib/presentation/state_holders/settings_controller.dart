import 'package:e_courier_360/data/models/branch.dart';
import 'package:e_courier_360/core/network_caller/request_methods/get_request.dart';
import 'package:e_courier_360/core/network_caller/request_methods/post_request.dart';
import 'package:e_courier_360/core/network_caller/request_methods/put_request.dart';
import 'package:e_courier_360/core/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/global_loading.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {

  List<Branch> _branches = [];
  List<Branch> get branches=>_branches;

  Future<bool> getBranches() async {
    showloading('Loading..');
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.branch,);
    if (response.success) {
     _branches = (response.returnValue as List<dynamic>)
          .map((json) => Branch.fromJson(json))
          .toList();
      update();
     showSuccess("success");
      return true;
    } else {
      showError(response.errorMessage);
      return false;
    }
  }

  Future<bool> addBranch(String name,String phone, String email,String address) async {
    showloading('Loading..');
    final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.branch,token: AuthController.token, {
    "name":name ,
    "phone": phone,
    "email": email,
    "address": address
    });
    if (response.success) {
      await getBranches();
      showSuccess("Done");
      return true;
    } else {
      showError(response.errorMessage);
      return false;
    }
  }
  Future<bool> updateBranch(String name,String phone, String email,String address,int branchId) async {
    showloading('Loading..');
    final  NetworkCallerReturnObject response =await PutRequest.execute(Urls.updateBranch(branchId),token: AuthController.token, {
    "name":name ,
    "phone": phone,
    "email": email,
    "address": address
    });
    if (response.success) {
      await getBranches();
      showSuccess("Done");
      return true;
    } else {
      showError(response.errorMessage);
      return false;
    }
  }
  // Future<bool> deleteBranch(int branchId) async {
  //   showloading('Loading..');
  //   final  NetworkCallerReturnObject response =await DeleteRequest.execute(Urls.updateBranch(branchId),token: AuthController.token);
  //   if (response.success) {
  //     await getBranches();
  //     showSuccess("Done");
  //     return true;
  //   } else {
  //     showError(response.errorMessage);
  //     return false;
  //   }
  // }
}