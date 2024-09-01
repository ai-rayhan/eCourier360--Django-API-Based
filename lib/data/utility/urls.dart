class Urls {
  // static const String baseUrl = 'http://192.168.0.193:8000/api';//Base API URL
  static const String siteUrl = 'http://10.0.2.2:8000';//Base API URL
  // static const String siteUrl = 'https://courier.2ndhandmarketbd.com/python12';//Base API URL
  static  String get apiUrl => '$siteUrl/api';
  
  //Auth and Verify
  static String signup = '$apiUrl/signup/';
  static String sendOtpToPhone = '$apiUrl/send-otp/';
  static String verifyPhoneOtp = '$apiUrl/verifyphone-otp/';
  static String signin = '$apiUrl/signin/';
  //Permission And Roles
  static String roles = '$apiUrl/roles/';
  static String permission = '$apiUrl/permissions/';

  //Merchant Profile
  // static String merchantRegister = '$apiUrl/signup/';
  // static String riderRegister = '$apiUrl/signup/';
  // static String createMerchant = '$baseUrl/merchants/create/';
  // static String addShop = '$apiUrl/merchants/allshop/';
  // static String shopList = '$apiUrl/merchants/shop/';
  // static String updateShop(int id) =>'$apiUrl/merchants/shop-update/$id/';



  // @Deprecated("Will remove")
  // static String updateProfile = '$apiUrl/updateprofile/';
  // static String viewProfile = '$apiUrl/viewprofile/';

  //Merchant info
  static String allMerchants = '$apiUrl/merchants/merchant/';
  static String merchantDetails(int mcid) => '$apiUrl/merchants/merchant/$mcid/';
  static String merchantActivate = '$apiUrl/merchants/activate/';
  static String updatemerchantProfile(int? mcId)=> '$apiUrl/merchants/merchant/update/$mcId/';
  static String merchantParcelSummary(int? mcId)=> '$apiUrl/parcels/merchant-parcel-summary/$mcId/';
  static String merchantPaymentHistory(int? mcId)=> '$apiUrl/accounts/payment-by-merchant/$mcId/';

  //Rider info
  static String riders = '$apiUrl/rider/list-create/';
  static String riderDetails(int riderId) => '$apiUrl/rider/riderdetails/$riderId/';
  static String riderActivate = '$apiUrl/rider/activate/';
  static String updateriderProfile(int? rID)=> '$apiUrl/rider/update/$rID/';
  static String riderParcelSummary(int rId) => '$apiUrl/parcels/rider-parcel-summary/$rId/';

  //Receiver info
  static String receiverList= '$apiUrl/receiver/receivers/';

  //User Bank Info
  static String bankInfo = '$apiUrl/bank/bank-info/';
  static String updateBankInfo(int? id)=> '$apiUrl/bank/bank-info/$id/';

  // DashBoard
  static String deliveryStatusWithParcelCount = '$apiUrl/settings/ds-parcel-count/';

  //Parcel Manage
  static String addParcel = '$apiUrl/parcels/list-create/';
  static String getParcels(int statusId) => '$apiUrl/parcels/getparcels/?delivery_status=$statusId';
  static String updateParcel(int id) =>'$apiUrl/parcels/update-destroy/$id/';

  static String addParcelDetails= '$apiUrl/parcels/parceldetails/';
  static String getParcelDetails(int id)=>'$apiUrl/parcels/parceldetails/?parcel=$id';
  static String updateParcelDetails(int id) =>'$apiUrl/parcels/parceldetails/$id/';

  static String trackingParcel(String voucherId) =>'$apiUrl/parcels/tracking/$voucherId/';
  static String updateStatusByBatch = '$apiUrl/parcels/update-status/';

  // Payment
  static String makeMerchantPayment = '$apiUrl/parcels/merchant-payment/';
  static String makeRiderPayment = '$apiUrl/parcels/rider-payment/';

  //Admin settings
  static String branch = '$apiUrl/branch/branches/';
  static String updateBranch(int id) =>'$apiUrl/branch/branches/$id/';
  static String deliveryZone = '$apiUrl/branch/delivery-zone/';
  static String updateDeliveryZone(int id) =>'$apiUrl/branch/delivery-zone/$id/';
  static String pickupZone = '$apiUrl/branch/pickup-zone/';
  static String updatePickupZone(int id) => '$apiUrl/branch/pickup-zone/$id/';
  static String category = '$apiUrl/settings/product-type/';
  static String updateCategory(id) => '$apiUrl/settings/product-type/$id/';
  static String deliveryType = '$apiUrl/settings/delivery-time/';
  static String updateDeliveryType(int id) => '$apiUrl/settings/delivery-time/$id/';
  static String deliveryStatus = '$apiUrl/settings/delivery-status/';
  static String smsProvider = '$apiUrl/settings/sms-provider/';


  // static String merchantParcels = '$apiUrl/merchants/parcels/';
  // static String merchantParcelsByStatus(int statusId) =>
  //     '$baseUrl/merchants/parcels-status/?delivery_status=$statusId';


}
