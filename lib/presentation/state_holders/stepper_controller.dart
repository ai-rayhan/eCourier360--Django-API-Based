import 'package:e_courier_360/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepperController extends GetxController {
 

  int _currentStep = 0;
  int get currentStep => _currentStep;



 bool updateCurrentStep(List<Step> steps) {
    if (_currentStep < steps.length - 1) {
      _currentStep += 1;
      update();
      return false;
    }else{
      return true;
      }

  }

  backCurrentStep(List<Step> steps) {
    if (_currentStep > 0) {
      _currentStep -= 1;
    } else {}
    update();
  }

  List<Product> _productList = [Product(id: 0,name: '',date: '', createdAt: '', updatedAt: '', parcel: 0, productType: 0)];
  List<Product> get productList => _productList;
  List<dynamic> productCategory = [null];

   set setProductList(List <Product> products) {
        _productList.clear();
        _productList  = products;
        update();
  }
  setTempProductCategory() {
        productCategory = List.generate(_productList.length, (index) => null);
        update();
  }
  add() {
    _productList.add(Product(id: 0, name: '', date: '', createdAt: '', updatedAt: '', parcel: 0, productType: 0));
    productCategory.add(null);
    update();
  }

  remove(int index) {
    if (index > 0) {
      _productList.removeAt(index);
      update();
    }
  }

  void saveFormData() {
    // Process saved data
    // log(productList.toString());
  }
}
