import 'package:e_courier_360/presentation/state_holders/sms_provider_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmsSettingsPage extends StatefulWidget {
  const SmsSettingsPage({super.key});

  @override
  State<SmsSettingsPage> createState() => _SmsSettingsPageState();
}

class _SmsSettingsPageState extends State<SmsSettingsPage> {
  final TextEditingController twilioSidController = TextEditingController();
  final TextEditingController twilioTokenController = TextEditingController();
  final TextEditingController twilioFromController = TextEditingController();
  final TextEditingController twilioStatusController = TextEditingController();
  final TextEditingController bulkSmsKeyController = TextEditingController();
  final TextEditingController bulkSmsSenderidController =
      TextEditingController();
  final TextEditingController bulkSmsStatusController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<SmsProviderController>().getSMSProvider();
    });
    // initTxt();
    super.initState();
  }

  // initTxt() {
  //   SmsProviderController smsprovider = Get.find<SmsProviderController>();
  //   twilioSidController.text = smsprovider.smsProviders[0].accountSid ?? "";
  //   twilioTokenController.text = smsprovider.smsProviders[0].authToken ?? '';
  //   twilioFromController.text = smsprovider.smsProviders[0].fromNumber ?? '';

  //   bulkSmsKeyController.text = smsprovider.smsProviders[1].apiKey ?? '';
  //   bulkSmsSenderidController.text = smsprovider.smsProviders[1].senderId ?? '';
  //   //  bulkSMS=smsprovider.smsProviders[1].senderId??''
  //   //  twilio=smsprovider.smsProviders[1].senderId??''
  // }

  bool bulkSMS = false;
  bool twilio = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SmsSection(
              title: 'TWILIO SMS',
              fields: [
                CustomInputField(
                    hintText: 'Twilio SID', controller: twilioSidController),
                CustomInputField(
                    hintText: 'Twilio Token',
                    controller: twilioTokenController),
                CustomInputField(
                    hintText: 'Twilio From', controller: twilioFromController),
              ],
              switchbtn: Switch(
                value: twilio,
                onChanged: (v) {
                  twilio = !twilio;
                  setState(() {});
                },
              ), onSaved: ()async { 
                Map<String,String> data={
                      "sms_provider": "twilio",
                       "account_sid": twilioSidController.text,
                       "auth_token": twilioTokenController.text,
                       "from_number": twilioFromController.text
                };
                await Get.find<SmsProviderController>().updateSMSProvider(data,1);
               },
            ),
            const SizedBox(height: 10),
            SmsSection(
              title: 'Bulk SMS',
              fields: [
                CustomInputField(
                    hintText: 'Bulk SMS API Key', controller: bulkSmsKeyController),
                CustomInputField(
                    hintText: 'Bulk SMS Sender ID',
                    controller: bulkSmsSenderidController),
              ],
              switchbtn: Switch(
                value: bulkSMS,
                onChanged: (v) {
                  bulkSMS = !bulkSMS;
                  setState(() {});
                },
              ), onSaved: ()async { 
                  Map<String,String> data={
                      "sms_provider": "bulksms",
                      "api_key":  bulkSmsKeyController.text,
                      "sender_id": bulkSmsSenderidController.text
                };
                await Get.find<SmsProviderController>().updateSMSProvider(data,2);
               },
            ),
          ],
        ),
      ),
    );
  }
}

class SmsSection extends StatelessWidget {
  final String title;
  final List<Widget> fields;
  final Widget switchbtn;
  final VoidCallback onSaved;

  const SmsSection(
      {super.key,
      required this.title,
      required this.fields,
      required this.switchbtn, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: appBoxDecoration(context),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...fields,
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Status:'),
                Transform.scale(
                    scale: 0.7, // Adjust the scale factor as needed
                    child: switchbtn),
                const Spacer(),
                TextButton(
                  onPressed: onSaved,
                  child: const Text('Save Change'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
