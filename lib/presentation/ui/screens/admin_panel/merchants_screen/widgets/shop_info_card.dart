import 'package:e_courier_360/data/models/merchant.dart';
import 'package:flutter/material.dart';
import 'package:e_courier_360/presentation/utility/box_decoration.dart';
class ShopInfoScreen extends StatelessWidget {
  const ShopInfoScreen({super.key, required this.merchant});
  final Merchant merchant;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.whiteDecoration,
      child:  Column(
        children: [
          InfoRow(
            icon: Icons.business,
            title: 'Business Name',
            subtitle:merchant.shopName,
          ),
          Divider(),
          InfoRow(
            icon: Icons.phone,
            title: 'Pickup Phone',
            subtitle: merchant.pickupPhone,
          ),
          Divider(),
          InfoRow(
            icon: Icons.location_on,
            title: 'Business Address',
            subtitle: merchant.shopAddress,
          ),
          Divider(),
          InfoRow(
            icon: Icons.location_on,
            title: 'Pickup Address',
            subtitle: merchant.pickupAddress??"Not given",
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

class BankInfoScreen extends StatelessWidget {
  const BankInfoScreen({super.key, required this.merchant});
  final Merchant merchant;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index) {
        return Container(
          decoration: AppBoxDecoration.whiteDecoration,
          child:  Column(
            children: [
              InfoRow(
                icon: Icons.business,
                title: 'Business Name',
                subtitle:merchant.shopName,
              ),
              Divider(),
              InfoRow(
                icon: Icons.phone,
                title: 'Pickup Phone',
                subtitle: merchant.pickupPhone,
              ),
              Divider(),
              InfoRow(
                icon: Icons.location_on,
                title: 'Business Address',
                subtitle: merchant.shopAddress,
              ),
              Divider(),
              InfoRow(
                icon: Icons.location_on,
                title: 'Pickup Address',
                subtitle: merchant.pickupAddress??"Not given",
              ),
            ],
          ),
        );
      }
    );
  }
}
