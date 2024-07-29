class Product {
  String? description;
  String? quantity;
  String? weight;
  String name;
  String? width;
  String? height;
  int productType;
  final int id;
  final int parcel;
  final String date;
  final String? heightLeft;
  final String? heightRight;
  final String? length;
  final String? createdAt;
  final String? updatedAt;


  Product( {
    required this.name, 
    required this.id,
    required this.date,
    this.description,
    this.quantity,
    this.weight,
    this.heightLeft,
    this.heightRight,
    this.length,
    this.width,
    this.height,
    required this.createdAt,
    required this.updatedAt,
    required this.parcel,
    required this.productType,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['date'],
      id: json['id'],
      date: json['date'],
      description: json['item_description'],
      quantity: json['quantity'],
      weight: json['weight'],
      heightLeft: json['height_left'],
      heightRight: json['height_right'],
      length: json['length'],
      width: json['width'],
      height: json['height'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      parcel: json['parcel'],
      productType: json['product_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'item_description': description,
      'quantity': quantity,
      'weight': weight,
      'height_left': heightLeft,
      'height_right': heightRight,
      'length': length,
      'width': width,
      'height': height,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'parcel': parcel,
      'product_type': productType,
    };
  }
}
