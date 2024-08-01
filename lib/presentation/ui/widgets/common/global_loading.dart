import 'package:flutter_easyloading/flutter_easyloading.dart';

void showloading(String? loadingMessage){
  EasyLoading.show(status: loadingMessage??'loading');
 }
void showSuccess(String successMessage){
 EasyLoading.showSuccess(successMessage);
 }
void showError(String errorMessage){
   EasyLoading.showError(errorMessage);
 }
void dismisLoading(){
   EasyLoading.dismiss();
 }