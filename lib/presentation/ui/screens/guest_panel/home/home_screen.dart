import 'package:e_courier_360/presentation/ui/base/base_home_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/auth/login_screen.dart';
import 'package:e_courier_360/presentation/ui/screens/common_module/auth/signup_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/center_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GuestHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseHomeScreen(
      bottomChild: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Welcome Image
          Center(
            // child: Image.asset('assets/welcome_image.png', height: 200),
            child: Container(), // Placeholder
          ),
          SizedBox(height: 20),

          // Welcome Text
          Text(
            'Welcome to eCourier360!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Sign up to enjoy more features and track your orders effortlessly.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.deepPurple[700],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          CenterMediumOutlinedbutton(
            labelText: "Sign in",
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Get.to(const LoginScreen());
            },
          ),
          SizedBox(height: 10),


          // const SizedBox(height: 30),

          // Services and Benefits Section for Riders
            _buildMerchantSection(),
          CenterMediumOutlinedbutton(
            labelText: "Apply As a Merchant",
            icon: const Icon(Icons.apartment_rounded),
            onPressed: () {
              Get.to(const SignupScreen(
                role: 'Merchant',
              ));
            },
          ),
                      // Apply as Rider or Merchant
          const SizedBox(height: 10),
          _buildRiderSection(),
          const SizedBox(height: 10),
          CenterMediumOutlinedbutton(
            labelText: "Apply As a Rider",
            icon: const Icon(Icons.card_travel),
            onPressed: () {
              Get.to(const SignupScreen(
                role: 'Rider',
              ));
            },
          ),
          

        ],
      ),
    );
  }

  Widget _buildRiderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Why Become a Rider?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        _buildBenefitCard(
          icon: Icons.directions_bike,
          title: 'Flexible Hours',
          description: 'Work on your own schedule and balance your work with personal life.',
        ),
        _buildBenefitCard(
          icon: Icons.attach_money,
          title: 'Competitive Earnings',
          description: 'Earn based on the number of deliveries and tips from satisfied customers.',
        ),
        _buildBenefitCard(
          icon: Icons.support,
          title: '24/7 Support',
          description: 'Get round-the-clock support and assistance from our dedicated team.',
        ),
      ],
    );
  }

  Widget _buildMerchantSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            'Why Partner with Us as a Merchant?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        _buildBenefitCard(
          icon: Icons.store,
          title: 'Increased Reach',
          description: 'Expand your customer base by reaching out to a wider audience through our platform.',
        ),
        _buildBenefitCard(
          icon: Icons.analytics,
          title: 'Data Insights',
          description: 'Access detailed analytics to understand your sales performance and customer behavior.',
        ),
        _buildBenefitCard(
          icon: Icons.support_agent,
          title: 'Dedicated Support',
          description: 'Receive personalized assistance to help you with any issues or queries.',
        ),
      ],
    );
  }

  Widget _buildBenefitCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.deepPurple, size: 40),
        title: Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}