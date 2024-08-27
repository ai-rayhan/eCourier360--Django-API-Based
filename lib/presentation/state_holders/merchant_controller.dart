import 'package:e_courier_360/data/models/merchant.dart';
import 'package:e_courier_360/core/network_caller/network_caller.dart';
import 'package:e_courier_360/core/network_caller/request_methods/dynamic_post_request.dart';
import 'package:e_courier_360/core/network_caller/request_methods/dynamic_put_request.dart';
import 'package:e_courier_360/core/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/global_loading.dart';
import 'package:get/get.dart';

class MerchantController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List <Merchant> _merchants=[];
  List <Merchant> get merchantList=>_merchants;
  Merchant getMerchantFromId(int id)=>_merchants.firstWhere((element)=>element.id==id);

  Future<bool> getAllMerchants() async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.allMerchants, token: AuthController.token,);
    _inProgress = false;
    if (response.success) {
     _merchants = (response.returnValue as List<dynamic>)
          .map((json) => Merchant.fromJson(json))
          .toList();
    //  _merchant.sort((a, b) => a.user.compareTo(b.user));
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

  Merchant? _merchantDetails;
  Merchant? get merchantDetails=>_merchantDetails;

  Future<bool> getMerchantDetails(int mcId) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.merchantDetails(mcId), token: AuthController.token,);
    _inProgress = false;
    if (response.success) {
     _merchantDetails = Merchant.fromJson(response.returnValue);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
/////////////////////Update Profile///////////////////

  Future<bool> updateProfile(String shopName,String shopAddress,String pickupAddress,String pickupPhone) async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await DynamicPutRequest.execute(Urls.updatemerchantProfile(AuthController.mcid), token: AuthController.token,{
    "shop_name":shopName ,
    "pickup_phone":pickupPhone,
    "shop_address": shopAddress,
    "pickup_address":pickupAddress,
     "user":AuthController.userId
     });
    _inProgress = false;
    if (response.success) {
      getMerchantDetails(AuthController.mcid!);
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
  ///////////Bank Information//////////
  
  
  Future<bool> addBankInfo(String bankName,String accountNumber,String accountName,String branch,String mobileNumber) async {
    _inProgress = true;
    update();
    showloading('Loading..');
     final  NetworkCallerReturnObject response =await DynamicPostRequest.execute(Urls.bankInfo, token: AuthController.token,{

    "bank_name": bankName,
    "account_number": accountNumber,
    "account_name":accountName,
    "branch":branch,
    "mobile_no":mobileNumber,
    "user": AuthController.userId,
    "payment_method": 1
     });
    _inProgress = false;
    if (response.success) {
      showSuccess("success");
      getMerchantDetails(AuthController.mcid!);
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      showError(response.errorMessage);
      return false;
    }
  }
  
  Future<bool> updateBankInfo(String bankName,String accountNumber,String accountName,String branch,String mobileNumber,int id) async {
    _inProgress = true;
    update();
    showloading('Loading..');
     final  NetworkCallerReturnObject response =await DynamicPutRequest.execute(Urls.updateBankInfo(id), token: AuthController.token,{

    "bank_name": bankName,
    "account_number": accountNumber,
    "account_name":accountName,
    "branch":branch,
    "mobile_no":mobileNumber,
    "user": AuthController.userId,
    "payment_method": 1
     });
    _inProgress = false;
    if (response.success) {
      showSuccess("success");
      getMerchantDetails(AuthController.mcid!);
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      showError(response.errorMessage);
      return false;
    }
  }
  ///////Activate Merchant///////////
  List<int>merchantIDList=[];
  int? selectedStatus;

  updateMerchantId(int merchantID){
    if(merchantIDList.contains(merchantID)){
      merchantIDList.remove(merchantID);
    }else{
      merchantIDList.add(merchantID);
    }
    update();
  }

  Future<bool> activateMerchant() async {
    _inProgress = true;
    update();
     final  NetworkCallerReturnObject response =await DynamicPutRequest.execute(Urls.merchantActivate, token: AuthController.token,{
         "status":selectedStatus,
         "merchant_ids":merchantIDList

     });
    _inProgress = false;
    if (response.success) {
     merchantIDList.clear();
     selectedStatus=null;
     getAllMerchants();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }

  // Future<bool> createMerchant(String name,String phone,String bussinessAddress) async {
  //   _inProgress = true;
  //   update();
  //    final  NetworkCallerReturnObject response =await PostRequest.execute(Urls.createMerchant, {
  //       "merchant_name": name,
  //       "bussiness_contact_info":phone,
  //       "bussiness_address":bussinessAddress,
  //   }, isLogin: true);
  //   _inProgress = false;
  //   if (response.success) {
  //     update();
  //     return true;
  //   } else {
  //     _errorMessage = response.errorMessage;
  //     update();
  //     return false;
  //   }
  // }

  // User? _user;
  // User? get currentUser=>_user;

  // Future<bool> getProfile() async {
  //   _inProgress = true;
  //   update();
  //    final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.viewProfile,);
  //   _inProgress = false;
  //   if (response.success) {
  //     _user= User.fromJson(response.returnValue);
  //     update();
  //     return true;
  //   } else {
  //     _errorMessage = response.errorMessage;
  //     update();
  //     return false;
  //   }
  // }
  //   Future<bool> updateProfile(String name,String phone,String address,File imageFile) async {
  //   _inProgress = true;
  //   update();
  //   final multipartFile = await MultipartConverter().imageToMultipartConverter(imageFile, 'photo');
  //    final  NetworkCallerReturnObject response =await PutRequest.execute(Urls.updateProfile,images: [multipartFile] ,{
  //        "full_name": name,
  //        "phone_number": phone,
  //        "address": address,
  //   },  token: AuthController.token);
  //   _inProgress = false;
  //   if (response.success) {
     
  //     update();
  //     return true;
  //   } else {
  //     _errorMessage = response.errorMessage;
  //     update();
  //     return false;
  //   }
  // }

  
  // Future<bool> updateShop(String shopName,String shopEmail,String shopAddress,int pickupZone,String pickupPhone,int shopid) async {
  //   _inProgress = true;
  //   update();
  //    final  NetworkCallerReturnObject response =await PutRequest.execute(Urls.updateShop(shopid), token: AuthController.token, {
  //     // "user": '2',
  //     // "merchant": '2',
  //     "shop_name": shopName,
  //     "shop_email": shopEmail,
  //     "shop_address": shopAddress,
  //     "pickup_zone": pickupZone.toString(),
  //     "pickup_phone": pickupPhone

  //   }, isLogin: true);
  //   _inProgress = false;
  //   if (response.success) {
  //     update();
  //     return true;
  //   } else {
  //     _errorMessage = response.errorMessage;
  //     update();
  //     return false;
  //   }
  // }

}
