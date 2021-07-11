import 'package:flutter/material.dart';
import 'package:flutter_application_4/views/question.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'dart:html' as html;

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/Authentic.png', fit: BoxFit.fitWidth),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CreatesignWidget(),
              SizedBox(width: 35),
              LoginWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

class CreatesignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator CreatesignWidget - GROUP
    return MaterialButton(
      onPressed: _launchURL,
      child: Container(
          width: 143,
          height: 42,
          child: Stack(children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                    width: 143,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
                            offset: Offset(0, 10),
                            blurRadius: 10)
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                      border: Border.all(
                        color: Color.fromRGBO(208, 205, 225, 1),
                        width: 1,
                      ),
                    ))),
            Positioned(
                top: 15,
                left: 28,
                child: Text(
                  'CREATE @sign',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(134, 124, 189, 1),
                      fontFamily: 'Open Sans',
                      fontSize: 13,
                      letterSpacing:
                          0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1),
                )),
          ])),
    );
  }
}

const _url = 'https://atsign.com/get-an-sign/';

void _launchURL() async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator LoginWidget - GROUP
    return MaterialButton(
      onPressed: () => Get.to(QuestionOne()),
      child: Container(
          width: 143,
          height: 42,
          child: Stack(children: <Widget>[
            Positioned(
                top: 0,
                left: 0,
                child: Container(
                    width: 143,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
                            offset: Offset(0, 10),
                            blurRadius: 10)
                      ],
                      color: Color.fromRGBO(134, 124, 189, 1),
                      border: Border.all(
                        color: Color.fromRGBO(225, 225, 225, 1),
                        width: 1,
                      ),
                    ))),
            Positioned(
                top: 13,
                left: 51,
                child: Text(
                  'LOGIN',
                  textAlign: TextAlign.left,
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
    );
  }
}
