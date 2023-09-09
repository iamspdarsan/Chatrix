import 'package:flutter/material.dart';
import 'responsive.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _Chat();
}

class _Chat extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    List<String> text = [
      "What can you do?",
      "I can control all your electric and electronic appliances over the world and I sense your usage to save electricity.",
      "Do you know tamil?",
      "Yeah I Know, should I switch to tamil ?",
      "What can you do?",
      "I can control all your electric and electronic appliances over the world and I sense your usage to save electricity.",
      "Do you know tamil?",
      "Yeah I Know, should I switch to tamil ?",
      "What can you do?",
      "I can control all your electric and electronic appliances over the world and I sense your usage to save electricity.",
      "Do you know tamil?",
      "Yeah I Know, should I switch to tamil ?",
    ];

    return SafeArea(
        child: Column(children: [
      Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: text.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(getresponsivesize(30, width: width))),
                      color: const Color.fromARGB(255, 201, 231, 239),
                    ),
                    margin: index % 2 == 0
                        ? const EdgeInsets.only(
                            top: 10, bottom: 10, left: 80, right: 10)
                        : const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 80),
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 30, right: 30),
                    child: Center(
                      child: Text(
                        text[index],
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            letterSpacing: 1,
                            wordSpacing: 2,
                            height: 1.2,
                            color: Colors.black,
                            fontSize: getresponsivesize(17, width: width),
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Segoe UI'),
                      ),
                    ));
              })),
      TextField(
        decoration: InputDecoration(
          label: Text("Enter your command"),
          contentPadding: EdgeInsets.all(10),
        ),
      )
    ]));
  }
}
