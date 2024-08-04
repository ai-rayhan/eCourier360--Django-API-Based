import 'package:e_courier_360/data/models/permission.dart';
import 'package:e_courier_360/data/models/role.dart';
import 'package:e_courier_360/presentation/state_holders/role_permission_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/custom_input_field.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/header_text.dart';
import 'package:e_courier_360/presentation/utility/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditRolesPermissionScreen extends StatefulWidget {
  final Role? role;
  const EditRolesPermissionScreen({super.key,  this.role});

  @override
  EditRolesPermissionScreenState createState() => EditRolesPermissionScreenState();
}

class EditRolesPermissionScreenState extends State<EditRolesPermissionScreen> {

  bool isAllSelected = false; 

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<RolePermissionController>().getPermissions().then((value) { 
           if(widget.role!=null){
      _nameTEController.text=widget.role?.name??"";
     for (int permId in  widget.role!.permissions) {
          Permission permission=  Get.find<RolePermissionController>().getPermissionFromId(permId);
            Get.find<RolePermissionController>().togglePermissionSelection(permission, true);
             }}});
             });
    super.initState();
  }
  final TextEditingController _nameTEController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Role'),
      ),
      body: GetBuilder<RolePermissionController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const HeaderText(title: "Role Name:"),
                CustomInputField(hintText: "Role Name",controller:_nameTEController,),
                AppSizedBox.h10,
                const HeaderText(title: "Permissions"),
                ListTile(
                  title: const Text('All'),
                  leading: Checkbox(
                    value: controller.isAllSelected,
                    onChanged: controller.toggleSelectAll,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                        itemCount: controller.permissions.length,
                        itemBuilder: (context, index) {
                          final permission = controller.permissions[index];
                          return ListTile(
                            title: Text(permission.codename),
                            subtitle: Text('${permission.contentTypeAppLabel} - ${permission.contentTypeModel}'),
                            leading: Checkbox(
                              value: permission.isSelected,
                              onChanged: (value) => controller.togglePermissionSelection(permission, value),
                            ),
                          );
                        },
                      )
                    
                ),
              ],
            ),
          );
        }
      ),
    );
  }
  @override
  void dispose() {
  _nameTEController.dispose();
    super.dispose();
  }
}

