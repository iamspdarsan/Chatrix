import 'package:flutter/material.dart';
import 'package:chatrix/socket.dart';
import 'package:chatrix/statemanager.dart';
import 'package:chatrix/responsive.dart';

class Remote extends StatefulWidget {
  const Remote({super.key});

  @override
  State<Remote> createState() => _Remote();
}

class _Remote extends State<Remote> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    StateManager stateManager = StateManager();
    stateManager.restoreOldState();
    return StreamBuilder(
        stream: stateManager.getStream(),
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: getresponsivesize(150, height: height),
                    width: getresponsivesize(150, height: width),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(getresponsivesize(45, width: width))),
                      color: const Color.fromARGB(255, 201, 231, 239),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: getresponsivesize(11, height: height),
                        ),
                        ImageIcon(
                          const AssetImage("assets/monitor.png"),
                          size: getresponsivesize(60, width: width),
                        ),
                        Text(
                          "Monitor",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: getresponsivesize(18, width: width)),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (stateManager.monitor) {
                              await sendCommand('2');
                            } else {
                              await sendCommand('1');
                            }
                            stateManager.updateState(monitor: 1);
                          },
                          child: Icon(
                            stateManager.monitor
                                ? Icons.toggle_on
                                : Icons.toggle_off_outlined,
                            color: Colors.red,
                            size: getresponsivesize(50, width: width),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: getresponsivesize(20, width: width),
                  ),
                  Container(
                    height: getresponsivesize(150, height: height),
                    width: getresponsivesize(150, width: width),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(getresponsivesize(45, width: width))),
                      color: const Color.fromARGB(255, 201, 231, 239),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: getresponsivesize(10, height: height),
                        ),
                        ImageIcon(
                          const AssetImage("assets/cpu.png"),
                          size: getresponsivesize(60, width: width),
                        ),
                        Text(
                          "CPU",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: getresponsivesize(18, width: width)),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (stateManager.cpu) {
                              await sendCommand('4');
                            } else {
                              await sendCommand('3');
                            }
                            stateManager.updateState(cpu: 1);
                          },
                          child: Icon(
                            stateManager.cpu
                                ? Icons.toggle_on
                                : Icons.toggle_off_outlined,
                            color: Colors.red,
                            size: getresponsivesize(50, width: width),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getresponsivesize(20, height: height),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: getresponsivesize(150, height: height),
                    width: getresponsivesize(150, width: width),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(getresponsivesize(45, width: width))),
                      color: const Color.fromARGB(255, 201, 231, 239),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: getresponsivesize(10, height: height),
                        ),
                        ImageIcon(
                          const AssetImage("assets/5.1.png"),
                          size: getresponsivesize(60, width: width),
                        ),
                        Text(
                          "5.1 AS",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: getresponsivesize(18, width: width)),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (stateManager.as) {
                              await sendCommand('6');
                            } else {
                              await sendCommand('5');
                            }
                            stateManager.updateState(as: 1);
                          },
                          child: Icon(
                            stateManager.as
                                ? Icons.toggle_on
                                : Icons.toggle_off_outlined,
                            color: Colors.red,
                            size: getresponsivesize(50, width: width),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: getresponsivesize(20, width: width),
                  ),
                  Container(
                    height: getresponsivesize(150, height: height),
                    width: getresponsivesize(150, width: width),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(getresponsivesize(45, width: width))),
                      color: const Color.fromARGB(255, 201, 231, 239),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: getresponsivesize(10, height: height),
                        ),
                        ImageIcon(
                          const AssetImage("assets/charger.png"),
                          size: getresponsivesize(60, width: width),
                        ),
                        Text(
                          "Charger",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: getresponsivesize(18, width: width)),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if (stateManager.charger) {
                              await sendCommand('8');
                            } else {
                              await sendCommand('7');
                            }
                            stateManager.updateState(charger: 1);
                          },
                          child: Icon(
                            stateManager.charger
                                ? Icons.toggle_on
                                : Icons.toggle_off_outlined,
                            color: Colors.red,
                            size: getresponsivesize(50, width: width),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getresponsivesize(20, height: height),
              ),
              Container(
                width: getresponsivesize(300, width: width),
                height: getresponsivesize(150, height: height),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 201, 231, 239),
                    borderRadius: BorderRadius.all(
                        Radius.circular(getresponsivesize(45, width: width)))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getresponsivesize(10, height: height),
                    ),
                    ImageIcon(
                      const AssetImage("assets/wifi-router.png"),
                      size: getresponsivesize(75, width: width),
                    ),
                    SizedBox(
                      height: getresponsivesize(10, height: height),
                    ),
                    Text(
                      "Always on",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: getresponsivesize(20, width: width)),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
