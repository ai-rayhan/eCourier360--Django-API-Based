import 'package:get/get.dart';

class ParcelDataController extends GetxController{
  // Parcel? _parcel;
  // Parcel? get parcel=>_parcel;
  // set setParcel(Parcel newParcel){
  //   _parcel=newParcel;
  //    update();
  //   }

String? _pickupZone, _name, _phoneNumber, _receiverAddress, _deliveryZone, _deliveryType, _invoiceId, _productCategory, _cashAmount, _sellingPrice, _weight,_merchantName;

int? parcelId;
int? _deliveryTypeID;
int? _receiverId;
int? _pickupZoneId;
int? _deliveryZoneId;
int? _merchantId;
set parcelID(int? value) {
    parcelId = value;
    update();
  }
int? get receiverId=>_receiverId;
 set receiverId(int? value) {
    _receiverId = value;
    update();
  }

String? get pickupZoneValue => _pickupZone;
  set pickupZoneValue(String? value) {
    _pickupZone = value;
    update();
  }

int? get pickupZoneId => _pickupZoneId;
  set pickupZoneId(int? value) {
    _pickupZoneId = value;
    update();
  }

String? get merchantNameValue => _merchantName;
  set merchantNameValue(String? value) {
    _merchantName = value;
    update();
  }

int? get merchantId => _merchantId;
  set merchantId(int? value) {
    _merchantId = value;
    update();
  }

  String? get nameValue => _name;
  set nameValue(String? value) {
    _name = value;
    update();
  }

  String? get phoneNumberValue => _phoneNumber;
  set phoneNumberValue(String? value) {
    _phoneNumber = value;
    update();
  }

  String? get receiverAddressValue => _receiverAddress;
  set receiverAddressValue(String? value) {
    _receiverAddress = value;
    update();
  }

  String? get deliveryZoneValue => _deliveryZone;
  set deliveryZoneValue(String? value) {
    _deliveryZone = value;
    update();
  }

int? get deliveryZoneId => _deliveryZoneId;
  set deliveryZoneId(int? value) {
    _deliveryZoneId = value;
    update();
  }

  String? get deliveryTypeValue => _deliveryType;
  set deliveryTypeValue(String? value) {
    _deliveryType = value;
    update();
  }
  int? get deliveryTypeID => _deliveryTypeID;
  set deliveryTypeID(int? value) {
    _deliveryTypeID = value;
    update();
  }

  String? get invoiceIdValue => _invoiceId;
  set invoiceIdValue(String? value) {
    _invoiceId = value;
    update();
  }

  String? get productCategoryValue => _productCategory;
  set productCategoryValue(String? value) {
    _productCategory = value;
    update();
  }

  String? get cashAmountValue => _cashAmount;
  set cashAmountValue(String? value) {
    _cashAmount = value;
    update();
  }

  String? get sellingPriceValue => _sellingPrice;
  set sellingPriceValue(String? value) {
    _sellingPrice = value;
    update();
  }

  String? get weightValue => _weight;
  set weightValue(String? value) {
    _weight = value;
    update();
  }
}