
import 'package:e_courier_360/data/models/category.dart';
import 'package:e_courier_360/core/network_caller/network_caller.dart';
import 'package:e_courier_360/core/network_caller/request_methods/put_request.dart';
import 'package:e_courier_360/core/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/global_loading.dart';

import 'package:get/get.dart';

class CategoryController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  
  List<Category> _categories = [];
  List<Category> get categories=>_categories;

  int getIdFromCategoryName(String categoryName)=>_categories.where((category) => category.title==categoryName).toList().first.id;
  String getNameFromId(int categoryID)=>_categories.where((category) => category.id==categoryID).toList().first.title;

  // Future<bool> getCategories() async {
  //   _inProgress = true;
  //   update();
  //    final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.productType,);
  //   _inProgress = false;
  //   if (response.success) { 
  //     List<dynamic> data=response.returnValue;
  //    _categories = data.map((categoryJson) => Category.fromJson(categoryJson)).toList();
  //     _categories.sort((a, b) => a.title.compareTo(b.title));
  //     log(_categories.toString());
  //     update();
  //     return true;
  //   } else {
  //     _errorMessage = response.errorMessage;
  //     update();
  //     return false;
  //   }
  // }
  
  Future<bool> getCategories() async {
    _inProgress = true;
    showloading('Loading..');
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.category);
    _inProgress = false;
    if (response.success) {
     List<dynamic> data=response.returnValue;
     _categories = data.map((categoryJson) => Category.fromJson(categoryJson)).toList();
      _categories.sort((a, b) => a.title.compareTo(b.title));
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
  
  Future<bool> addCategory(String title) async {
    showloading('Loading..');
    final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.category,token: AuthController.token, {
    "title":title ,
    });
    if (response.success) {
      await getCategories();
      showSuccess("success");
      return true;
    } else {
      showError(response.errorMessage);
      return false;
    }
  }
  Future<bool> updateCategory(String title,int categoryId) async {
    showloading('Loading..');
    final  NetworkCallerReturnObject response =await PutRequest.execute(Urls.updateCategory(categoryId),token: AuthController.token, {
     "title":title ,
    });
    if (response.success) {
      await getCategories();
      return true;
    } else {
      showError(response.errorMessage);
      return false;
    }
  }
}
