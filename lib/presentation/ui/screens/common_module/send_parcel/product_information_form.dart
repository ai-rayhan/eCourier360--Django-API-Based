import 'dart:developer';
import 'package:e_courier_360/presentation/state_holders/category_controller.dart';
import 'package:e_courier_360/presentation/state_holders/stepper_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductInfoForm extends StatelessWidget {
  const ProductInfoForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StepperController>(builder: (stepperController) {
      return Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          ListView.builder(
            itemCount: stepperController.productList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Product No: ${index + 1}",
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w700)),
                    ),
                    IconButton(
                      onPressed: () {
                        stepperController.remove(index);
                        log(stepperController.productList.length.toString());
                      },
                      icon: const Icon(Icons.remove),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                InputCard(
                  child: TextFormField(
                    initialValue: stepperController.productList[index].name,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Item Name',
                      hintText: 'Item Name',
                      prefixIcon: Icon(Icons.hourglass_top_outlined),
                    ),
                    onSaved: (newValue) => stepperController
                        .productList[index].name = newValue ?? '',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<CategoryController>(builder: (categoryController) {
                  List<String> productCategories = categoryController.categories
                      .map((category) => category.title)
                      .toList();
                  return InputCard(
                    child: Visibility(
                      replacement: const Center(
                        child: SizedBox(child: Text('Loading..')),
                      ),
                      visible: !categoryController.inProgress,
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Product Category',
                          prefixIcon: Icon(Icons.category_rounded),
                        ),
                        value: stepperController.productCategory[index],
                        items: productCategories.map((level) {
                          return DropdownMenuItem<String>(
                            value: level,
                            child: Text(
                              level,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          stepperController.productList[index].productType =
                              categoryController.getIdFromCategoryName(value!);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select Product category';
                          }
                          return null;
                        },
                      ),
                    ),
                  );
                }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputCard(
                        child: TextFormField(
                          initialValue:
                              stepperController.productList[index].weight,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Weight(Kg)',
                            hintText: 'Weight(Kg)',
                            prefixIcon: Icon(Icons.hourglass_top_outlined),
                          ),
                          onSaved: (newValue) => stepperController
                              .productList[index].weight = newValue,
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter weight';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InputCard(
                        child: TextFormField(
                          initialValue:
                              stepperController.productList[index].quantity,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Quantity',
                            hintText: 'Quantity',
                            prefixIcon: Icon(Icons.hourglass_top_outlined),
                          ),
                          onSaved: (newValue) => stepperController
                              .productList[index].quantity = newValue,
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter quantity';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputCard(
                        child: TextFormField(
                          initialValue:
                              stepperController.productList[index].height,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Height(Inch.)',
                            hintText: 'Height(Inch.)',
                            prefixIcon: Icon(Icons.hourglass_top_outlined),
                          ),
                          onSaved: (newValue) => stepperController
                              .productList[index].height = newValue,
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter Height';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: InputCard(
                        child: TextFormField(
                          initialValue:
                              stepperController.productList[index].width,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Width(Inch.)',
                            hintText: 'Width(Inch.)',
                            prefixIcon: Icon(Icons.hourglass_top_outlined),
                          ),
                          onSaved: (newValue) => stepperController
                              .productList[index].width = newValue,
                          validator: (String? value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Enter Width';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                InputCard(
                  child: TextFormField(
                    initialValue:
                        stepperController.productList[index].description,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Customer Note',
                      hintText: 'Customer Note',
                      prefixIcon: Icon(Icons.hourglass_top_outlined),
                    ),
                    onSaved: (newValue) => stepperController
                        .productList[index].description = newValue,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  stepperController.add();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      );
    });
  }
}


// import 'dart:developer';
// import 'package:e_courier_360/presentation/state_holders/local/stepper_controller.dart';
// import 'package:e_courier_360/presentation/state_holders/parcel_controller.dart';
// import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ProductInfoForm extends StatelessWidget {
//   const ProductInfoForm({
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     final ParcelController parcelController=Get.find();
//     return GetBuilder<StepperController>(builder: (stepperController) {
//       return Column(
//         children: [
//           const SizedBox(
//             height: 8,
//           ),
//           ListView.builder(
//             itemCount: stepperController.productList.length,
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) => Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text("Product No: ${index + 1}",
//                           style: const TextStyle(
//                               fontSize: 19, fontWeight: FontWeight.w700)),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         stepperController.remove(index);
//                         log(stepperController.productList.length.toString());
//                       },
//                       icon: const Icon(Icons.remove),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                    InputCard(
//                     child: DropdownButtonFormField<String>(
//                       decoration: const InputDecoration(
//                         labelText: 'Product Category',
//                         prefixIcon: Icon(Icons.category_rounded),
//                       ),
//                       value: stepperController.productCategory[index],
//                       items: parcelController.categoriers.map((level) {
//                         return DropdownMenuItem<String>(
//                           value: level,
//                           child: Text(
//                             level,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         stepperController.productList[index].productType =parcelController.getCategoryId(value!);
//                         stepperController.productList[index].type?.title =value;
//                       },
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please select Product category';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: InputCard(
//                         child: TextFormField(
//                           initialValue:
//                               stepperController.productList[index].weight.toString(),
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: const InputDecoration(
//                             labelText: 'Weight(Kg)',
//                             hintText: 'Weight(Kg)',
//                             prefixIcon: Icon(Icons.hourglass_top_outlined),
//                           ),
//                           onSaved: (newValue) => stepperController
//                               .productList[index].weight = newValue!,
//                           validator: (String? value) {
//                             if (value?.trim().isEmpty ?? true) {
//                               return 'Enter weight';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                       child: InputCard(
//                         child: TextFormField(
//                           initialValue:
//                               stepperController.productList[index].quantity.toString(),
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: const InputDecoration(
//                             labelText: 'Quantity',
//                             hintText: 'Quantity',
//                             prefixIcon: Icon(Icons.hourglass_top_outlined),
//                           ),
//                           onSaved: (newValue) => stepperController
//                               .productList[index].quantity = newValue!,
//                           validator: (String? value) {
//                             if (value?.trim().isEmpty ?? true) {
//                               return 'Enter quantity';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: InputCard(
//                         child: TextFormField(
//                           initialValue:
//                               stepperController.productList[index].heightLeft,
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: const InputDecoration(
//                             labelText: 'Height(Inch.)',
//                             hintText: 'Height(Inch.)',
//                             prefixIcon: Icon(Icons.hourglass_top_outlined),
//                           ),
//                           onSaved: (newValue) => stepperController
//                               .productList[index].heightLeft = newValue!,
//                           validator: (String? value) {
//                             if (value?.trim().isEmpty ?? true) {
//                               return 'Enter Height';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Expanded(
//                       child: InputCard(
//                         child: TextFormField(
//                           initialValue:
//                               stepperController.productList[index].heightRight,
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: const InputDecoration(
//                             labelText: 'Width(Inch.)',
//                             hintText: 'Width(Inch.)',
//                             prefixIcon: Icon(Icons.hourglass_top_outlined),
//                           ),
//                           onSaved: (newValue) => stepperController
//                               .productList[index].heightRight = newValue!,
//                           validator: (String? value) {
//                             if (value?.trim().isEmpty ?? true) {
//                               return 'Enter Width';
//                             }
//                             return null;
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 InputCard(
//                   child: TextFormField(
//                     initialValue:
//                         stepperController.productList[index].itemDescription,
//                     keyboardType: TextInputType.emailAddress,
//                     decoration: const InputDecoration(
//                       labelText: 'Customer Note',
//                       hintText: 'Customer Note',
//                       prefixIcon: Icon(Icons.hourglass_top_outlined),
//                     ),
//                     onSaved: (newValue) => stepperController
//                         .productList[index].itemDescription = newValue??"",
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               const SizedBox(width: 10),
//               IconButton(
//                 onPressed: () {
//                   stepperController.add();
//                 },
//                 icon: const Icon(Icons.add),
//               ),
//             ],
//           ),
//         ],
//       );
//     });
//   }
// }
