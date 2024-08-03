import 'package:e_courier_360/presentation/state_holders/role_permission_controller.dart';
import 'package:e_courier_360/presentation/ui/screens/admin_panel/settings_screen/role_permissions_screen/role_permissions_screen.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/appbar.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/center_progress_indicator.dart';
import 'package:e_courier_360/presentation/ui/widgets/settings/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllRolesScreen extends StatefulWidget {
  const AllRolesScreen({super.key});

  @override
  State<AllRolesScreen> createState() => _AllRolesScreenState();
}

class _AllRolesScreenState extends State<AllRolesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<RolePermissionController>().getRoles();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:  const CourierAppBar(
      title: "Roles",
      ),
      body:GetBuilder<RolePermissionController>(
        builder: (controller) {
          return Visibility(
            visible: !controller.inProgress,
            replacement: const Center(child:  CenterCircularProgressIndicator(),),
            child: ListView.builder(
              itemCount: controller.roleList.length,
              itemBuilder: (context,index)=>SettingsCard(
              title: controller.roleList[index].name,
             subtitle: controller.roleList[index].permissions.toString(), iconData: Icons.admin_panel_settings, ontap: (){
              Get.to( EditRolesPermissionScreen(role:controller.roleList[index],));
             },
             trailling: IconButton(icon: const Icon(Icons.edit),onPressed: (){

             },),
             ))

          );
        }
      ),
           
           bottomNavigationBar: Padding(
             padding: const EdgeInsets.all(8.0),
             child: ElevatedButton(onPressed: (){
              Get.to(const EditRolesPermissionScreen());
             }, child: const Text("Add Role")),
           ),
            );
  }
}