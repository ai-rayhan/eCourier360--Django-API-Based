
class ParcelData {
  final String pickupLocation;
  final int? customerId;
  final String receiverName;
  final String phoneNumber;
  final String receiverAddress;
  final String deliveryZone;
  final String invoiceId;
  final String productCategory;
  final String cod;
  final String sellingPrice;
  final String weight;
  final double deliveryCharge;
  final int deliveryType;

  ParcelData( {
    required this.deliveryCharge,
    required this.customerId,
    required this.pickupLocation,
    required this.receiverName,
    required this.phoneNumber,
    required this.receiverAddress,
    required this.deliveryZone,
    required this.invoiceId,
    required this.productCategory,
    required this.cod,
    required this.sellingPrice,
    required this.weight,
    required this.deliveryType,
  });
}