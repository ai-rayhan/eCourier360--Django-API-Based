import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController tabController;
  final List<String> tabs;

  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorWeight: 6,
      isScrollable: true,
      controller: tabController,
      tabs: List.generate(tabs.length, (index) {
        return Tab(
          child: Text(tabs[index], style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        );
      }),
    );
  }
  

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


}