

import 'package:e_courier_360/data/models/permission.dart';
import 'package:e_courier_360/data/models/role.dart';
import 'package:e_courier_360/data/services/network_caller/network_caller.dart';
import 'package:e_courier_360/data/services/network_caller/request_methods/dynamic_post_request.dart';
import 'package:e_courier_360/data/services/network_caller/request_methods/dynamic_put_request.dart';
import 'package:e_courier_360/data/services/network_caller/request_return_object.dart';
import 'package:e_courier_360/data/utility/urls.dart';
import 'package:e_courier_360/presentation/state_holders/auth_controller.dart';
import 'package:e_courier_360/presentation/ui/widgets/common/global_loading.dart';
import 'package:get/get.dart';

class RolePermissionController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMessage = '';
  String get errorMessage => _errorMessage;
  
  List<Role> _rolelist = [];
  List<Role> get roleList=>_rolelist;
  
  Future<bool> getRoles() async {
    _inProgress = true;
    showloading('Loading..');
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.roles,);
    _inProgress = false;
    if (response.success) {
     _rolelist = (response.returnValue as List<dynamic>)
          .map((json) => Role.fromJson(json))
          .toList();
     _rolelist.sort((a, b) => a.name.compareTo(b.name));
      update();
      showSuccess("success");
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      showError(response.errorMessage);
      return false;
    }
  }
  
  
   List<Permission> _permissions = [
    // Permission(id: 112, codename: 'view', contentTypeAppLabel: 'settings/deliverytype', contentTypeModel: 'deliverytype'),
    // Permission(id: 113, codename: 'add', contentTypeAppLabel: 'settings/deliverytype', contentTypeModel: 'deliverytype'),
    // Permission(id: 114, codename: 'update', contentTypeAppLabel: 'settings/deliverytype', contentTypeModel: 'deliverytype'),
    // Permission(id: 115, codename: 'delete', contentTypeAppLabel: 'settings/deliverytype', contentTypeModel: 'deliverytype'),
  ];
  List<Permission> get permissions=>_permissions;
  
  Future<bool> getPermissions() async {
    _inProgress = true;
    showloading('Loading..');
    update();
     final  NetworkCallerReturnObject response =await GetRequest.execute(Urls.permission,);
    _inProgress = false;
    if (response.success) {
      _permissions =(response.returnValue['permissions'] as List<dynamic>)
          .map((json) => Permission.fromJson(json))
          .toList();
      groupPermissionsByContentTypeModel(_permissions);
      update();
      showSuccess("success");
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      showError(response.errorMessage);
      return false;
    }
  }
  List<List<Permission>> grpPerm=[];
  List<List<Permission>> groupPermissionsByContentTypeModel(List<Permission> permissions) {
  Map<String, List<Permission>> groupedPermissions = {};

  for (var permission in permissions) {
    if (groupedPermissions.containsKey(permission.contentTypeModel)) {
      groupedPermissions[permission.contentTypeModel]!.add(permission);
    } else {
      groupedPermissions[permission.contentTypeModel] = [permission];
    }
  }
  grpPerm=groupedPermissions.values.toList();
  return groupedPermissions.values.toList();
}
  Future<bool> addRole(String name) async {
    showloading('Loading..');
    final  NetworkCallerReturnObject response =await DynamicPostRequest.execute(Urls.roles,token: AuthController.token, {
    "name":name ,
    "permissions":selectedPermissionId,
    });
    if (response.success) {
      showSuccess("success");
      await getRoles();
      return true;
    } else {
      showError(response.errorMessage);
      return false;
    }
  }
  Future<bool> updateRole(String name,int roleId) async {
    showloading('Loading..');
    final  NetworkCallerReturnObject response =await DynamicPutRequest.execute("${Urls.roles}$roleId/",token: AuthController.token, {
     "name":name ,
    "permissions": selectedPermissionId,
    });
    if (response.success) {
      // await getPickupZone(branchId: branchId);
      return true;
    } else {
      showError(response.errorMessage);
      return false;
    }
  }

bool isAllSelected = false;
List<int> get selectedPermissionId =>selectedPermission.map((permission)=>permission.id).toList();
List<Permission> selectedPermission = [];

void toggleSelectAll(bool? value) {
  isAllSelected = value ?? false;
  selectedPermission.clear(); 

  for (Permission permission in permissions) {
    permission.isSelected = isAllSelected;
    if (permission.isSelected) {
      selectedPermission.add(permission);
    }
  }
  update();
}

void togglePermissionSelection(Permission permission, bool? value) {
  permission.isSelected = value ?? false;
  if (permission.isSelected) {
    if (!selectedPermission.contains(permission)) {
      selectedPermission.add(permission);
    }
  } else {
    selectedPermission.remove(permission);
  }

  // Update `isAllSelected` based on the current selection state
  isAllSelected = permissions.every((permission) => permission.isSelected);
  // log(permissionId.toString());
  update();
}

Permission getPermissionFromId(int permId){
Permission permission= _permissions.firstWhere((element) => element.id==permId);
return permission;
}
}
