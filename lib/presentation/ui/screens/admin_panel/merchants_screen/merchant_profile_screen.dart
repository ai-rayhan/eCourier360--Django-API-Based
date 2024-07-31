import 'package:e_courier_360/comming_soon_module/parcel_summary_screen.dart';
import 'package:e_courier_360/data/models/merchant.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_tabbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/merchant/credential_form.dart';
import 'package:e_courier_360/presentation/utility/box_decoration.dart';
import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';

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
  final Merchant merchant;
  @override
  MerchantDetailsScreenState createState() => MerchantDetailsScreenState();
}

class MerchantDetailsScreenState extends State<MerchantDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = [
    'Bussiness Information',
    // 'Credential',
    'Parcel Summury'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
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
          children:  [

            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: MerchantEditScreen(merchant:widget.merchant),
            // ),
            // CredentialEditScreen(merchant: widget.merchant,),
            MerchantBussinessInfo(),
            ParcelSummaryScreen(),

          ],
        ),
      ),
    );
  }
}

class CredentialEditScreen extends StatefulWidget {
  const CredentialEditScreen({super.key, required this.merchant});
  final Merchant merchant;
  @override
  State<CredentialEditScreen> createState() => _CredentialEditScreenState();
}

class _CredentialEditScreenState extends State<CredentialEditScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confimPasswordController = TextEditingController();
  int? status;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CredentialForm(
         onStatusChanged: (index, value) {
         status=index+1;
        },
          passwordController: _passwordController,
          confimPasswordController: _confimPasswordController, statusId: 1,
        ),
          // GetBuilder<MerchantProfileController>(
          //     builder: (controller) {
          //       return Visibility(
          //         visible: !controller.inProgress,
          //         replacement: const CenterCircularProgressIndicator(),
          //         child: SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){
                    
          //           controller.updateProfile(widget.merchant.username, widget.merchant.fullName,widget.merchant.shopName, widget.merchant.shopEmail,widget.merchant.pickupPhone,widget.merchant.pickupAddress, widget.merchant.shopAddress,widget.merchant.id,_passwordController.text,status);
          //         }, child:const Text("Update")),),
          //       );
          //     }
          //   )
      ],
    );
  }
}


// import 'package:flutter/material.dart';


class ShopInfoScreen extends StatelessWidget {
  const ShopInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.whiteDecoration,
      child: const Column(
        children: [
          InfoRow(
            icon: Icons.business,
            title: 'Business Name',
            subtitle: 'App user',
          ),
          Divider(),
          InfoRow(
            icon: Icons.phone,
            title: 'Pickup Phone',
            subtitle: '0124983297',
          ),
          Divider(),
          InfoRow(
            icon: Icons.location_on,
            title: 'Business Address',
            subtitle: 'App@app.com',
          ),
          Divider(),
          InfoRow(
            icon: Icons.location_on,
            title: 'Pickup Address',
            subtitle: 'App@app.com',
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const InfoRow({super.key, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle),
        ),
      ],
    );
  }
}