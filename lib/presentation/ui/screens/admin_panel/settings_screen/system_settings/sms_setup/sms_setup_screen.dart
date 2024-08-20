import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/utility_urls.dart';
import 'package:flutter/material.dart';

class SmsSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMS Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SmsSection(
              title: 'TWILIO SMS',
              fields: [
                 CustomInputField(hintText: 'Twilio SID *'),
                 CustomInputField(hintText: 'Twilio Token *'),
                 CustomInputField(hintText: 'Twilio from *'),
                 CustomInputField(hintText:'Status'),
              ],
            ),
            SizedBox(height: 10),
            SmsSection(
              title: 'Bulk SMS',
              fields: [
                CustomInputField(hintText: 'Bulk SMS Key'),
                CustomInputField(hintText: 'Bulk SMS Secret Key'),
                CustomInputField(hintText:'Status'),
              ],
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

  SmsSection({required this.title, required this.fields});

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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...fields,
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Text('Status:'),
              Transform.scale(
                  scale: 0.7, // Adjust the scale factor as needed
                  child: Switch(
                    value: true, 
                    onChanged: (v) {},
                  ),
                ),

                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text('Save Change'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
