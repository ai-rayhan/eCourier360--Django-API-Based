
import 'package:e_courier_360/data/models/common/bank_information.dart';
import 'package:e_courier_360/presentation/state_holders/merchant_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditBankInfoScreen extends StatefulWidget {
  const EditBankInfoScreen({super.key, this.bankInformation});
   final BankInformation? bankInformation;
  @override
  State<EditBankInfoScreen> createState() => _EditBankInfoScreenState();
}

class _EditBankInfoScreenState extends State<EditBankInfoScreen> {


  String? 
      bankName,
      accountNumber,
      accountName,
      branch,
      mobileNo;

  final _formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Edit Business Profile",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white)),
        ),
        body: GetBuilder<MerchantController>(
            builder: (mcProfileController) {
          return Visibility(
            visible: !mcProfileController.inProgress,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ListView(
              padding: const EdgeInsets.all(14),
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                     
                      CustomInputField(
                        initialValue:widget.bankInformation?.bankName,
                        hintText: "Bank Name",
                        headerText: "Bank Name",
                        onSavedForm: (val) => bankName = val,
                      ),
                      CustomInputField(
                        initialValue:widget.bankInformation?.accountNumber,
                        hintText: "Account Number",
                        headerText: "Account Number",
                        onSavedForm: (val) => accountNumber = val,
                      ),
                      CustomInputField(
                        initialValue:widget.bankInformation?.accountName,
                        hintText: "Account Name",
                        headerText: "Account Name",
                        onSavedForm: (val) => accountName = val,
                      ),
                      CustomInputField(
                        initialValue:widget.bankInformation?.branch,
                        hintText: "Branch",
                        headerText: "Branch",
                        onSavedForm: (val) => branch = val,
                      ),
                      CustomInputField(
                        initialValue:widget.bankInformation?.mobileNo,
                        hintText: "Mobile Number",
                        headerText: "Mobile Number",
                        onSavedForm: (val) => mobileNo = val,
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
                          if(widget.bankInformation==null){
                            Get.find<MerchantController>().addBankInfo(
                              bankName!, accountNumber!, accountName!, branch!, mobileNo!
                            );
                          }else{
                            Get.find<MerchantController>().updateBankInfo(
                              bankName!, accountNumber!, accountName!, branch!, mobileNo!,widget.bankInformation!.id
                            );
                          }
                          },
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.bankInformation==null?
                                'Add Bank':'Update Bank',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.update),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
