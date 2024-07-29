import 'package:e_courier_360/data/models/product.dart';
import 'package:e_courier_360/presentation/state_holders/category_controller.dart';
import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:e_courier_360/presentation/utility/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key, required this.product});
  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController=Get.find();
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title:  Text('Added Products:',style: AppTextStyle.primary14w600),
            tilePadding: const EdgeInsets.symmetric(vertical: 5),
            childrenPadding: const EdgeInsets.symmetric(vertical: 0),
            children: <Widget>[
              // Your expandable content here, for example, another ListView.builder
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:product.length, // Replace this with your actual item count
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product[index].name, style: AppTextStyle.primary14w600),
                     RichText(
                     text: TextSpan(
                       children: <TextSpan>[
                         TextSpan(
                           text: 'Category: ',
                           style: AppTextStyle.primary14w600.copyWith(fontSize: 13)
                         ),
                         TextSpan(
                           text: '${categoryController.getNameFromId(product[index].productType)} ',
                           style: AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor)
                         ),
                         TextSpan(
                           text: ' Quantity: ',
                           style: AppTextStyle.primary14w600.copyWith(fontSize: 13)
                         ),
                         TextSpan(
                           text: '${product[index].quantity}',
                           style: AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor)
                         ),
                         TextSpan(
                           text: ' Weight: ',
                           style: AppTextStyle.primary14w600.copyWith(fontSize: 13)
                         ),
                         TextSpan(
                           text: '${product[index].weight}',
                           style: AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor)
                         ),
                         TextSpan(
                           text: ' Dimension: ',
                           style: AppTextStyle.primary14w600.copyWith(fontSize: 13)
                         ),
                         TextSpan(
                           text: '${product[index].height}*${product[index].width}',
                           style: AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor)
                         ),
                        
                       ],
                     ),
                   ),
                     Text(product[index].description??"", style: AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor)),
                     const Divider()
                  ],);
               
                },
              ),
            ],
          ),
        );}}

// import 'package:e_courier_360/data/models/response/parcel_details_response.dart';
// import 'package:e_courier_360/presentation/utility/app_colors.dart';
// import 'package:e_courier_360/presentation/utility/text_style.dart';
// import 'package:flutter/material.dart';


// class ProductListView extends StatelessWidget {
//   const ProductListView({super.key, required this.product});
//   final List<Item>? product;

//   @override
//   Widget build(BuildContext context) {
//         return Theme(
//           data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
//           child: ExpansionTile(
//             title:  Text('Added Products:',style: AppTextStyle.primary14w600),
//             tilePadding: const EdgeInsets.symmetric(vertical: 5),
//             childrenPadding: const EdgeInsets.symmetric(vertical: 0),
//             children: <Widget>[
//               ListView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 itemCount:product?.length??0, 
//                 itemBuilder: (BuildContext context, int index) {
//                   return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(product![index].itemDescription, style: AppTextStyle.primary14w600),
//                      RichText(
//                      text: TextSpan(
//                        children: <TextSpan>[
//                          TextSpan(
//                            text: 'Category: ',
//                            style: AppTextStyle.primary14w600.copyWith(fontSize: 13)
//                          ),
//                          TextSpan(
//                            text:product![index].type?.title??"",
//                            style: AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor)
//                          ),
//                          TextSpan(
//                            text: ' Quantity: ',
//                            style: AppTextStyle.primary14w600.copyWith(fontSize: 13)
//                          ),
//                          TextSpan(
//                            text: '${product![index].quantity} ',
//                            style: AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor)
//                          ),
//                          TextSpan(
//                            text: ' Weight: ',
//                            style: AppTextStyle.primary14w600.copyWith(fontSize: 13)
//                          ),
//                          TextSpan(
//                            text: '${product![index].weight} ',
//                            style: AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor)
//                          ),
//                          TextSpan(
//                            text: ' Dimension: ',
//                            style: AppTextStyle.primary14w600.copyWith(fontSize: 13)
//                          ),
//                          TextSpan(
//                            text: '${product![index].heightLeft}*${product![index].heightRight}',
//                            style: AppTextStyle.darkGrey13Bold.copyWith(color: AppColors.secondaryColor)
//                          ),
                        
//                        ],
//                      ),
//                    ),
//                   ],);
               
//                 },
//               ),
//             ],
//           ),
//         );}}
