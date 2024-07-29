
import 'dart:developer';

import 'package:e_courier_360/data/models/category.dart';
import 'package:e_courier_360/data/services/network_caller/network_caller.dart';
import 'package:e_courier_360/data/services/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';

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

  Future<bool> getCategories() async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.productType,);
    _inProgress = false;
    if (response.success) { 
      List<dynamic> data=response.returnValue;
     _categories = data.map((categoryJson) => Category.fromJson(categoryJson)).toList();
      _categories.sort((a, b) => a.title.compareTo(b.title));
      log(_categories.toString());
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
