import 'package:e_courier_360/data/models/delivery_type_info.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_type_controller.dart';
import 'package:get/get.dart';
import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  final DeliveryInfo deliveryTypeInfo;
  final double weight;
  final double height;
  final double width;
  final String category;

  const ResultScreen({
    Key? key,
    required this.deliveryTypeInfo,
    required this.weight,
    required this.height,
    required this.width,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Result",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Center(
                child: Text(
                  'Calculation Result',
                  style: AppTextStyle.theme16w600.copyWith(fontSize: 22)
                ),
              ),
              const SizedBox(height: 16),
              _buildResultRow('Delivery Type:', deliveryTypeInfo.deliveryType),
              _buildResultRow('Weight (KG):', weight.toString()),
              _buildResultRow('Height (Inch):', height.toString()),
              _buildResultRow('Width (Inch):', width.toString()),
              _buildResultRow('Category:', category),
              const Divider(),
              _buildResultRow("Total Cost:",Get.find<DeliveryTypeInfoController>().calcaculationResult(deliveryTypeInfo, height, width, weight) )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style:AppTextStyle.primary14w600.copyWith(fontSize: 16),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style:AppTextStyle.primary14w600.copyWith(fontSize: 16,color: AppColors.secondaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
