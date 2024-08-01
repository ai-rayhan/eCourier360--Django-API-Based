import 'package:e_courier_360/data/models/delivery_type_info.dart';
import 'package:e_courier_360/presentation/state_holders/delivery_type_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/input_card.dart';
import 'package:e_courier_360/presentation/ui/screens/merchant_panel/calculate_screen/result_screen.dart';
import 'package:e_courier_360/presentation/utility/app_colors.dart';
import 'package:e_courier_360/presentation/utility/box_decoration.dart';
import 'package:e_courier_360/presentation/utility/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  final List<String> categories = [
    "Electronics",
    "Clothing",
    "Books",
    "Furniture",
    "Others"
  ];
  int selectedIndex = -1;
  final _formKey = GlobalKey<FormState>();

  DeliveryInfo? deliveryTypeInfo;
  double? height;
  double? width;
  double? weight;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Calculate",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Text('Fill Information',
                          style: TextStyle(
                              fontFamily: FontFamily.popins,
                              fontSize: 17,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: AppBoxDecoration.whiteDecoration,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(children: [
                      GetBuilder<DeliveryTypeInfoController>(
                          builder: (deliveryTypeInfoController) {
                        List<String> deliveryZone = deliveryTypeInfoController
                            .deliveryTypes
                            .map((zone) => zone.deliveryType)
                            .toList();
                        return InputCard(
                          child: Visibility(
                            visible: !deliveryTypeInfoController.inProgress,
                            replacement: const Center(
                              child: SizedBox(child: Text('Loading..')),
                            ),
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: 'Delivery Type',
                                prefixIcon: Icon(Icons.system_update_alt_sharp),
                              ),
                              value: null,
                              items: deliveryZone.map((level) {
                                return DropdownMenuItem<String>(
                                  value: level,
                                  child: Text(
                                    level,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {},
                              onSaved: (value) {
                                deliveryTypeInfo=deliveryTypeInfoController.getDeliveryTypeFromName(value!);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select your delivery type';
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
                      InputCard(
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              hintText: 'Weight (KG)',
                              prefixIcon: Icon(Icons.hourglass_top_outlined)),
                              onSaved: (newValue) => weight=double.tryParse(newValue!),
                          validator: (String? value) {
                            if (value == null ||value.isEmpty||double.tryParse(value)!=null) {
                              return 'Enter weight';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InputCard(
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: 'Height',
                                  hintText: 'Inch.',
                                  prefixIcon: Icon(Icons.height),
                                ),
                                 onSaved: (newValue) => height=double.tryParse(newValue!),
                                validator: (String? value) {
                                  if (value == null ||value.isEmpty||double.tryParse(value)!=null) {
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
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: 'Width',
                                  hintText: 'Inch.',
                                  prefixIcon: Icon(Icons.width_full_outlined),
                                ),
                                 onSaved: (newValue) => width=double.tryParse(newValue!),
                                validator: (String? value) {
                                  if (value == null ||value.isEmpty||double.tryParse(value)!=null) {
                                    return 'Enter Width';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Text('Categories',
                          style: TextStyle(
                              fontFamily: FontFamily.popins,
                              fontSize: 17,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Text(
                  "Which category are you sending?",
                  style: AppTextStyle.grey14,
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: List<Widget>.generate(categories.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: FilterChip(
                        label: Text(categories[index]),
                        selected: selectedIndex == index,
                        selectedColor: AppColors.secondaryColor,
                        onSelected: (isSelected) {
                          setState(() {
                            if (isSelected) {
                              selectedIndex = index; // Set the selected index
                            } else {
                              selectedIndex = -1; // Deselect the current index
                            }
                          });
                        },
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.validate();
                      _formKey.currentState!.save();
                         Get.to(ResultScreen(
                           deliveryTypeInfo: deliveryTypeInfo!,
                           weight: weight!,
                           height: height!,
                           width: width!,
                           category: categories[selectedIndex],
                         ));
                          },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Calculate',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.arrow_circle_right_outlined),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
