// import 'package:flutter/material.dart';

// class ExtendedAppBar extends StatefulWidget implements PreferredSizeWidget {
//   final List<String> categories;

//   ExtendedAppBar(this.categories);

//   @override
//   _ExtendedAppBarState createState() => _ExtendedAppBarState(categories);

//   @override
//   Size get preferredSize {
//     return Size(MediaQuery.of(context).size.width,
//         MediaQuery.of(context).size.height * 0.2);
//   }
// }

// class _ExtendedAppBarState extends State<ExtendedAppBar> {
//   List<String> categories;

//   _ExtendedAppBarState(this.categories);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: AppBar(
//         leading:
//             Container(), // remove if back button is need on the news headlines page
//         backgroundColor: const Color(0xfffffefe),
//         elevation: 0,
//         flexibleSpace: Column(
//           children: <Widget>[CustomAppBar(), CustomTabBar(categories)],
//         ),
//       ),
//     );
//   }
// }
