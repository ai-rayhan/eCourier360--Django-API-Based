
class AddparcelData {
   String receiverPhone;
   String receiverAddress;
   String receiverName;
   String merchantId;
   String merchantInvoiceId;
   int shippingModeType;
   String deliveryDate;
   String timeSlot;
   int pickupZoneId;
   int deliveryZoneId;
   String cashCollection;
   String parcelEquivalentPrice;
   String deliveryCharge;
   List<String> productType;
   List<String> weight;
   List<String> itemDescription;
   List<String> quantity;
   List<String> heightLeft;
   List<String> heightRight;
   String deliveryStatus;
   int? receiverId;

  AddparcelData({
    required this.receiverPhone,
    required this.receiverAddress,
    required this.receiverName,
    required this.merchantId,
    required this.merchantInvoiceId,
    required this.shippingModeType,
    required this.deliveryDate,
    required this.timeSlot,
    required this.pickupZoneId,
    required this.deliveryZoneId,
    required this.cashCollection,
    required this.parcelEquivalentPrice,
    required this.deliveryCharge,
    required this.productType,
    required this.weight,
    required this.itemDescription,
    required this.quantity,
    required this.heightLeft,
    required this.heightRight,
    required this.deliveryStatus,
     this.receiverId,
  });
   Map<String, dynamic> toMap() {
    return {
      "receiverPhone": receiverPhone,
      "receiverAddress": receiverAddress,
      "receiverName": receiverName,
      "merchent_id": merchantId,
      "marchent_invoice_id": merchantInvoiceId,
      "shipping_mode_type": shippingModeType,
      "delivery_date": deliveryDate,
      "time_sloat": timeSlot,
      "pickup_zone_id": pickupZoneId,
      "delivery_zone_id": deliveryZoneId,
      "cod": null,
      "cash_collection": cashCollection,
      "parcel_equivalent_price": parcelEquivalentPrice,
      "delivery_charge": deliveryCharge,
      "product_type": productType,
      "weight": weight,
      "item_description": itemDescription,
      "quantity": quantity,
      "height_left": heightLeft,
      "height_right": heightRight,
      "delivery_status": deliveryStatus,
      "receiver_id": receiverId,
    };
  }}