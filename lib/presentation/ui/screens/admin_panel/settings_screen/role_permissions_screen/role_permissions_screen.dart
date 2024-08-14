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
                  title: const Text('Role'),
                  leading: CircleAvatar(child: Text('R.ID')),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('All'),
                      Checkbox(
                        value: controller.isAllSelected,
                        onChanged: controller.toggleSelectAll,
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child: ListView.builder(
                //         itemCount: controller.permissions.length,
                //         itemBuilder: (context, index) {
                //           final permission = controller.permissions[index];
                //           return ListTile(
                //             title: Text(permission.codename),
                //             subtitle: Text('${permission.contentTypeAppLabel} - ${permission.contentTypeModel}'),
                //             leading: CircleAvatar(child: Text("${permission.id}")),
                //             trailing: Checkbox(
                //               value: permission.isSelected,
                //               onChanged: (value) => controller.togglePermissionSelection(permission, value),
                //             ),
                //           );
                //         },
                //       )
                    
                // ),
                  Expanded(
                  child: ListView.builder(
                        itemCount:  controller.grpPerm.length,
                        itemBuilder: (context, index) {
                          final permissionGroups =  controller.grpPerm[index];
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0,8,0,0),
                                child: HeaderText(title: permissionGroups.first.contentTypeModel.toUpperCase(),),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: permissionGroups.length,
                                itemBuilder: (context,index2){
                                Permission permission=permissionGroups[index2];
                                return ListTile(
                                title: Text(permission.codename),
                                subtitle: Text('${permission.contentTypeAppLabel} - ${permission.contentTypeModel}'),
                                leading: CircleAvatar(child: Text("${permission.id}")),
                                trailing: Checkbox(
                                  value: permission.isSelected,
                                  onChanged: (value) => controller.togglePermissionSelection(permission, value),
                                ),
                              );
                              }),
                            ],
                          );
                        },
                      )
                    
                ),
              ],
            ),
          );
        }
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(onPressed: (){
          if(_nameTEController.text==''){
            return;
          }
          if(widget.role==null){
            Get.find<RolePermissionController>().addRole(_nameTEController.text);
          }else{
             Get.find<RolePermissionController>().updateRole(_nameTEController.text,widget.role!.id);
          }
        }, child: Text(widget.role==null?"Add Role":"Update Role")),
      ),
    );
  }
  @override
  void dispose() {
  _nameTEController.dispose();
    super.dispose();
  }
}

