import 'package:e_courier_360/presentation/state_holders/category_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_dialog.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/ui/widgets/settings/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {

  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<CategoryController>().getCategories();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }
  TextEditingController _titleTEController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:  const CourierAppBar(
      title: "Categories",
      ),
      body:GetBuilder<CategoryController>(
        builder: (controller) {
          return Visibility(
            visible: !controller.inProgress,
            replacement: const Center(child: const CenterCircularProgressIndicator(),),
            child: ListView.builder(
              itemCount: controller.categories.length,
              itemBuilder: (context,index)=>SettingsCard(
              title: controller.categories[index].title,
             subtitle: '', iconData: Icons.category_outlined,
             trailling: Icon(Icons.edit),
              ontap: (){
              _titleTEController.text=controller.categories[index].title;
              showInputDialog(context: context, title: "Update Category",content:CustomInputField(hintText: 'Title',controller: _titleTEController,),
               onSubmitPressed: () async{
              await Get.find<CategoryController>().updateCategory(_titleTEController.text,controller.categories[index].id);
              _titleTEController.clear();
             },);
             },
            
             ))

          );
        }
      ),
           
           bottomNavigationBar: Padding(
             padding: const EdgeInsets.all(8.0),
             child: ElevatedButton(onPressed: (){
             showInputDialog(context: context, title: "Add Category",content:CustomInputField(hintText: 'Category',controller: _titleTEController,),
             onSubmitPressed: () async{
              await Get.find<CategoryController>().addCategory(_titleTEController.text);
               _titleTEController.clear();
             },
             );
             }, child: const Text("Add Category")),
           ),

            );
  }
    @override
  void dispose() {
  _titleTEController.dispose();
    super.dispose();
  }
}