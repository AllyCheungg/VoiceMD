import 'package:flutter/material.dart';
import 'package:flutter_application_4/views/authentication.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/VoiceMDLogo.png', fit: BoxFit.fitWidth),
            MyStatelessWidget(),
          ],
        ),
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30),
          MaterialButton(
            //style: ElevatedButton.styleFrom(
            //textStyle: const TextStyle(fontSize: 20)),
            onPressed: () => Get.to(Authenticate()), // go to ...
            //child: const Text("LET'S START"),
            child: Container(
                width: 250,
                height: 42,
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                          width: 250,
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Color.fromRGBO(133, 123, 189, 1),
                            border: Border.all(
                              color: Color.fromRGBO(225, 225, 225, 1),
                              width: 1,
                            ),
                          ))),
                  Positioned(
                      top: 12,
                      left: 88,
                      child: Text(
                        'LET’S START',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Open Sans',
                            fontSize: 13,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                ])),
          )
        ],
      ),
    );
  }
}
