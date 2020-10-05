import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      selectedItemColor: const Color(0xff0f4d83),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType
          .shifting, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble),
          title: Text('Chat'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          title: Text('Marketplace'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text('Profile'),
        ),
      ],
    );

    // return Container(
    //   width: MediaQuery.of(context).size.width,
    //   height: 50,
    //   child: Container(
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       // boxShadow: [
    //       //   BoxShadow(
    //       //     color: Colors.grey.withOpacity(0.2),
    //       //     spreadRadius: 10,
    //       //     blurRadius: 5,
    //       //     offset: Offset(0, 3),
    //       //   ),
    //       // ],
    //     ),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: <Widget>[
    //         IconButton(
    //           onPressed: () {},
    //           icon: Icon(
    //             Icons.home,
    //             size: 30.0,
    //           ),
    //         ),
    //         IconButton(
    //           onPressed: () {},
    //           icon: Icon(
    //             Icons.chat_bubble,
    //             size: 30.0,
    //           ),
    //         ),
    //         IconButton(
    //           onPressed: () {},
    //           icon: Icon(
    //             Icons.shopping_basket,
    //             size: 30.0,
    //           ),
    //         ),
    //         IconButton(
    //           onPressed: () {},
    //           icon: Icon(
    //             Icons.account_circle,
    //             size: 30.0,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //   decoration: BoxDecoration(
    //     color: const Color(0xfffffefe),
    //     borderRadius: BorderRadius.only(
    //         topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
    //   ),
    // );
  }
}
