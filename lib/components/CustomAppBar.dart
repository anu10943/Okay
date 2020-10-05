import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String subtitle;

  CustomAppBar({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: const Color(0xff0f4d83),
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          bottom: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.025,
          right: MediaQuery.of(context).size.width * 0.06,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
              child: BackButton(
                color: Colors.white,
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.width * 0.14,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://res.cloudinary.com/hostelling-internation/image/upload/t_hostel_carousel/f_auto,q_auto/v1565973406/kwunkr44mtjdrqrzz3s7.jpg'),
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.025,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.05,
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.05,
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
