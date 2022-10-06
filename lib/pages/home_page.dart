import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool animationBegin = true;
  double leftMove = 0.0;
  double rigtMove = 0.0;
  Color color = Colors.red;
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  label: const Text("Name"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  label: const Text("Email"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: password,
                onChanged: (value) {
                  if (value.length > 6) {
                    setState(() {
                      color = Colors.green;
                      animationBegin = false;
                      leftMove = 0.0;
                      rigtMove = 0.0;
                    });
                  } else {
                    setState(() {
                      color = Colors.red;
                      animationBegin = true;
                    });
                  }
                },
                decoration: InputDecoration(
                  label: const Text("Password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              AnimatedContainer(
                height: 100,
                alignment: Alignment.center,
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.only(
                  left: leftMove,
                  right: rigtMove,
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: _onclick,
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onHover: (val) {
                      setState(() {
                        if (leftMove == 0 && animationBegin) {
                          Future.delayed(
                            const Duration(microseconds: 1),
                            () {
                              leftMove = 150;
                              rigtMove = 0;
                              print("left:");
                            },
                          );
                        }
                        if (leftMove == 150 && animationBegin) {
                          Future.delayed(
                            const Duration(microseconds: 1),
                            () {
                              print("right:");
                              rigtMove = 150;
                              leftMove = 0;
                            },
                          );
                        }
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onclick() {
    setState(() {
      if (leftMove == 0 && animationBegin) {
        leftMove = 150;
        rigtMove = 0;
        print("left:");
      }
      if (leftMove == 150 && animationBegin) {
        print("right:");
        rigtMove = 150;
        leftMove = 0;
      }
    });
  }
}
