import 'package:chatrix/responsive.dart';
import 'package:flutter/material.dart';
import 'remote.dart';
import 'voicechat.dart';
import 'about.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _Home();
}

List<Widget> tabs = const [Remote(), Chat(), About()];

class _Home extends State<Home> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(
                    getresponsivesize(80, width: width),
                    getresponsivesize(90, height: height)),
                bottomRight: Radius.elliptical(
                    getresponsivesize(80, width: width),
                    getresponsivesize(90, height: height)))),
        backgroundColor: const Color.fromARGB(255, 201, 231, 239),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: getresponsivesize(20, width: width),
            ),
            Text(
              "Chatrix",
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: getresponsivesize(50, width: width),
                  color: Colors.black,
                  letterSpacing: 10),
            ),
            ImageIcon(
              const AssetImage('assets/appbar.png'),
              size: getresponsivesize(55, width: width),
              color: Colors.black,
            ),
          ],
        ),
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 201, 231, 239),
        onTap: (value) {
          setState(() {
            currentindex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                radius: getresponsivesize(30, width: width),
                child: ImageIcon(
                  const AssetImage('assets/remote.png'),
                  color: Colors.black,
                  size: getresponsivesize(40, width: width),
                ),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                radius: getresponsivesize(30, width: width),
                child: ImageIcon(
                  const AssetImage('assets/voice.png'),
                  color: Colors.black,
                  size: getresponsivesize(35, width: width),
                ),
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: Colors.white,
                radius: getresponsivesize(30, width: width),
                child: ImageIcon(
                  const AssetImage('assets/about.png'),
                  color: Colors.black,
                  size: getresponsivesize(40, width: width),
                ),
              ),
              label: ""),
        ],
      ),
      body: tabs[currentindex],
    );
  }
}
