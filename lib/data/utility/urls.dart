class Urls {
  static const String baseUrl = 'http://10.0.2.2:8000/api';//Base API URL
  // static const String baseUrl = 'https://courier.2ndhandmarketbd.com/api';
  
  static String signin = '$baseUrl/signin/';
  static String signup = '$baseUrl/signup/';
  static String roles = '$baseUrl/roles/';
  static String permission = '$baseUrl/permissions/';

  static String merchantRegister = '$baseUrl/signup/';
  static String riderRegister = '$baseUrl/signup/';
  // static String createMerchant = '$baseUrl/merchants/create/';
  static String addShop = '$baseUrl/merchants/allshop/';
  static String shopList = '$baseUrl/merchants/shop/';
  static String updateShop(int id) =>'$baseUrl/merchants/shop-update/$id/';
  static String sendOtpToPhone = '$baseUrl/send-otp/';
  static String verifyPhoneOtp = '$baseUrl/verifyphone-otp/';
  static String updateProfile = '$baseUrl/updateprofile/';

  static String allMerchants = '$baseUrl/merchants/allmerchants/';
  static String activateMerchant = '$baseUrl/merchants/activate/';

  static String viewProfile = '$baseUrl/viewprofile/';
  
  static String riders = '$baseUrl/rider/list-create/';


  //Admin settings
  static String branch = '$baseUrl/branch/branches/';
  static String updateBranch(int id) =>'$baseUrl/branch/branches/$id/';
  static String deliveryZone = '$baseUrl/branch/delivery-zone/';
  static String updateDeliveryZone(int id) =>'$baseUrl/branch/delivery-zone/$id/';
  static String pickupZone = '$baseUrl/branch/pickup-zone/';
  static String updatePickupZone(int id) => '$baseUrl/branch/pickup-zone/$id/';
  static String category = '$baseUrl/settings/product-type/';
  static String updateCategory(id) => '$baseUrl/settings/product-type/$id/';
  static String receiverList= '$baseUrl/receiver/receivers/';


  static String addParcel = '$baseUrl/parcels/list-create/';
  static String addParcelDetails= '$baseUrl/parcels/parceldetails/';
  static String getParcelDetails(int id)=>'$baseUrl/parcels/parceldetails/?parcel=$id';
  static String updateParcel(int id) =>'$baseUrl/parcels/update-destroy/$id/';
  static String updateParcelDetails(int id) =>'$baseUrl/parcels/parceldetails/$id/';

  static String deliveryType = '$baseUrl/settings/delivery-time/';
  static String updateDeliveryType(int id) => '$baseUrl/settings/delivery-time/$id/';
  static String deliveryStatus = '$baseUrl/settings/ds-parcel-count/';

  static String merchantParcels = '$baseUrl/merchants/parcels/';
  static String merchantParcelsByStatus(int statusId) =>
      '$baseUrl/merchants/parcels-status/?delivery_status=$statusId';
  static String merchantParcelsByVoucherId(String voucherId) =>
      '$baseUrl/merchants/parcel-id/?voucher_id=$voucherId';

}
