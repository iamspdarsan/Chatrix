import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'responsive.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 201, 231, 239),
            radius: getresponsivesize(120, width: width),
            child: CircleAvatar(
              backgroundImage: const AssetImage("assets/cresteem.jpg"),
              radius: getresponsivesize(110, width: width),
            ),
          ),
          SizedBox(
            height: getresponsivesize(15, height: height),
          ),
          Text(
            "Buy your smart companion",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: getresponsivesize(35, width: width),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: getresponsivesize(15, height: height),
          ),
          GestureDetector(
            onTap: () async {
              String url = 'https://www.cresteem.com/shop';
              if (await canLaunchUrlString(url)) {
                launchUrlString(url, mode: LaunchMode.inAppWebView);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Text(
              'cresteem.com/shop',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: getresponsivesize(25, width: width)),
            ),
          )
        ],
      ),
    ));
  }
}
