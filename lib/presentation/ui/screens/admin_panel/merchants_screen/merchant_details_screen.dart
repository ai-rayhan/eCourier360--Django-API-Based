import 'package:e_courier_360/data/helper/string_converter.dart';
import 'package:e_courier_360/data/models/merchant_parcel_summary.dart';
import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
import 'package:e_courier_360/presentation/state_holders/parcel_summary_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/merchants_screen/widgets/shop_info_card.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_tabbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/empty_data.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/speace_between_row.dart';
import 'package:e_courier_360/presentation/utility/box_decoration.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:get/get.dart';

// class MerchantDetailsScreen extends StatefulWidget {
//   const MerchantDetailsScreen({super.key, required this.merchant});
//   final Merchant merchant;
//   @override
//   MerchantDetailsScreenState createState() => MerchantDetailsScreenState();
// }

// class MerchantDetailsScreenState extends State<MerchantDetailsScreen>
//     with SingleTickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CourierAppBar(
//         title: "Merchant",
//       ),
//       body: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: MerchantEditScreen(merchant:widget.merchant),
//             ),
//     );
//   }
// }


class MerchantDetailsScreen extends StatefulWidget {
  const MerchantDetailsScreen({super.key, required this.merchant});
  final int? merchant;
  @override
  MerchantDetailsScreenState createState() => MerchantDetailsScreenState();
}

class MerchantDetailsScreenState extends State<MerchantDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = [
    'Bussiness Information',
    'Parcel Summury'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 100));
      await Get.find<MerchantController>().getMerchantDetails(widget.merchant!);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CourierAppBar(
        title: "Merchant",
        bottom: CustomTabBar(tabController: _tabController, tabs: _tabs),
      ),
      body: 
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: TabBarView(
          controller: _tabController,
          children:   [
            const MerchantBussinessInfo(),
            MerchantParcelSummaryScreen(merchantId:widget.merchant!),

          ],
        ),
      ),
    );
  }
}

class MerchantParcelSummaryScreen extends StatefulWidget {
  final int merchantId;

  const MerchantParcelSummaryScreen({required this.merchantId, super.key});

  @override
  State<MerchantParcelSummaryScreen> createState() => _MerchantParcelSummaryScreenState();
}

class _MerchantParcelSummaryScreenState extends State<MerchantParcelSummaryScreen> {
  @override
  void initState() {
    Get.lazyPut<ParcelSummaryController>(() => ParcelSummaryController());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<ParcelSummaryController>().getMerchantParcelSummary(widget.merchantId);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ParcelSummaryController>(
        builder: (controller) {
          if (controller.inProgress) {
            return const Center(child: CircularProgressIndicator());
          }  else if(controller.parcelSummary==null){
            return EmptyDataPage();
          } else{
            ParcelSummary summary = controller.parcelSummary!;
            return Column(
              children: [
                Container(
                  decoration: appBoxDecoration(context),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SpaceBetweenRow(title: 'Total Parcel', value: summary.totalParcel.toString()),
                        SpaceBetweenRow(title: 'Approved', value: summary.approved.toString()),
                        SpaceBetweenRow(title: 'Delivery', value: summary.delivery.toString()),
                        SpaceBetweenRow(title: 'Partial', value: summary.partial.toString()),
                        SpaceBetweenRow(title: 'Return + Returned', value: summary.returnReturned.toString()),
                        SpaceBetweenRow(title: 'Parcel Price', value: summary.parcelPrice.toStringAsFixed(2)),
                        SpaceBetweenRow(title: 'Cash Collection', value: summary.cashCollection.toStringAsFixed(2)),
                        SpaceBetweenRow(title: 'Merchant Paid', value: summary.merchantPaid.toStringAsFixed(2)),
                        SpaceBetweenRow(title: 'Delivery Charge (-)', value: summary.deliveryCharge.toStringAsFixed(2)),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        },
      );
  }
}


class MerchantBussinessInfo extends StatelessWidget {
  const MerchantBussinessInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GetBuilder<MerchantController>(
        builder: (controller) {
          return Visibility(
            visible: controller.merchantDetails!=null,
            replacement:const EmptyDataPage(),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  AppSizedBox.h16,
                   CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.purple,
                    child: Text(
                     getFirstCharactersOfWords(controller.merchantDetails?.shopName??"Empty"),
                      style: const TextStyle(fontSize: 24.0, color: Colors.white),
                    ),
                  ),
                  AppSizedBox.h10,
                  //  Text(
                  //   merchant.user.username,
                  //   style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  // ),
                  AppSizedBox.h16,
                  const HeaderText(title: "Shop Information:"),
                  const ShopInfoScreen(),
                  AppSizedBox.h16,
                  const HeaderText(title: "Bank Information:"),
                  controller.merchantDetails?.bankInformation!=null?Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: controller.merchantDetails!.bankInformation!.map((bankInfo) {
                      return Container(
                        decoration: appBoxDecoration(context),
                        child: ListTile(
                          title: Text( "Bank Name :${bankInfo.bankName}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          subtitle: Text("Acc.No:${bankInfo.accountNumber}  Branch:${bankInfo.branch}"),
                        ),
                      );
                    }).toList(),
                  ):const Center(child:  Text("No Bank Information Added"),),
                  
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

class ParcelSummaryScreen extends StatelessWidget {
  const ParcelSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const HeaderText(title: "Parcel Information:"),
          Container(
            decoration: appBoxDecoration(context),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(children: [  SpaceBetweenRow(title: 'Total Parcel', value: '0'),
                SpaceBetweenRow(title: 'Approved', value: '0'),
                SpaceBetweenRow(title: 'Delivery', value: '0'),
                SpaceBetweenRow(title: 'Partial', value: '0'),
                SpaceBetweenRow(title: 'Return + Returned', value: '0'),
                SpaceBetweenRow(title: 'Parcel Price', value: '0'),
                SpaceBetweenRow(title: 'Cash Collection', value: '0'),
                SpaceBetweenRow(title: 'Merchant Paid', value: '0'),
                SpaceBetweenRow(title: 'Delivery Charge (-)', value: '0'),],),
            ),
          )],);
  }
}

// // class CredentialEditScreen extends StatefulWidget {
// //   const CredentialEditScreen({super.key, required this.merchant});
// //   final Merchant merchant;
// //   @override
// //   State<CredentialEditScreen> createState() => _CredentialEditScreenState();
// // }

// // class _CredentialEditScreenState extends State<CredentialEditScreen> {
// //   final TextEditingController _passwordController = TextEditingController();
// //   final TextEditingController _confimPasswordController = TextEditingController();
// //   int? status;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         CredentialForm(
// //          onStatusChanged: (index, value) {
// //          status=index+1;
// //         },
// //           passwordController: _passwordController,
// //           confimPasswordController: _confimPasswordController, statusId: 1,
// //         ),
// //           // GetBuilder<MerchantProfileController>(
// //           //     builder: (controller) {
// //           //       return Visibility(
// //           //         visible: !controller.inProgress,
// //           //         replacement: const CenterCircularProgressIndicator(),
// //           //         child: SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){
                    
// //           //           controller.updateProfile(widget.merchant.username, widget.merchant.fullName,widget.merchant.shopName, widget.merchant.shopEmail,widget.merchant.pickupPhone,widget.merchant.pickupAddress, widget.merchant.shopAddress,widget.merchant.id,_passwordController.text,status);
// //           //         }, child:const Text("Update")),),
// //           //       );
// //           //     }
// //           //   )
// //       ],
// //     );
// //   }
// // }


// // import 'package:flutter/material.dart';


// class ShopInfoScreen extends StatelessWidget {
//   const ShopInfoScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: appBoxDecoration(context),
//       child: const Column(
//         children: [
//           InfoRow(
//             icon: Icons.business,
//             title: 'Business Name',
//             subtitle: 'App user',
//           ),
//           Divider(),
//           InfoRow(
//             icon: Icons.phone,
//             title: 'Pickup Phone',
//             subtitle: '0124983297',
//           ),
//           Divider(),
//           InfoRow(
//             icon: Icons.location_on,
//             title: 'Business Address',
//             subtitle: 'App@app.com',
//           ),
//           Divider(),
//           InfoRow(
//             icon: Icons.location_on,
//             title: 'Pickup Address',
//             subtitle: 'App@app.com',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class InfoRow extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String subtitle;

//   const InfoRow({super.key, required this.icon, required this.title, required this.subtitle});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [

//         ListTile(
//           leading: Icon(icon),
//           title: Text(
//             title,
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           subtitle: Text(subtitle),
//         ),
//       ],
//     );
//   }
// }