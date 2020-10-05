import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<Tab> tabs;
  final TabController controller;

  CustomTabBar({this.tabs, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: TabBar(
        labelColor: Colors.black,
        tabs: tabs,
        controller: controller,
        indicatorWeight: 3,
        indicatorColor: Colors.blue[800],
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }
}
