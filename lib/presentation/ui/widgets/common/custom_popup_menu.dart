import 'package:flutter/material.dart';

class CustomPopupMenuButton extends StatelessWidget {
  final List<PopupMenuEntry<int>> menuItems;
  final void Function(int) onSelected;
  final IconData icon;

  CustomPopupMenuButton({
    required this.menuItems,
    required this.onSelected,
    this.icon = Icons.more_vert, // Default icon
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(icon),
      onSelected: onSelected,
      itemBuilder: (context) => menuItems,
    );
  }
}


// CustomPopupMenuButton(
//                         icon: Icons.more_vert,
//                         onSelected: (value) {
//                           if(value==1){
//                             Get.to(EditBranchScreen(branch: controller.branches[index],));
//                           }else{
//                             controller.deleteBranch(controller.branches[index].id);
//                             controller.getBranches();
//                           }
//                         },
//                         menuItems: const [
//                           PopupMenuItem<int>(
//                             value: 1,
//                             child: Text('Update'),
//                           ),
//                           PopupMenuItem<int>(
//                             value: 2,
//                             child: Text('Delete'),
//                           ),
//                         ],
//                       ),