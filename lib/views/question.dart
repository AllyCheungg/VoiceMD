import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

class QuestionOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
              child: Image.asset(
                'assets/images/Assessment.png',
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
              ),
            ),
          ),
          VoicebuttonWidget()
        ],
      ),
    );
  }
}

class VoicebuttonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SemiRoundedBorderButton(
        borderSide: const BorderSide(
            color: const Color.fromRGBO(139, 117, 193, 1), width: 2.0),
        radius: const Radius.circular(450),
        background: const Color.fromRGBO(139, 117, 193, 1),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Container(
                width: 58,
                height: 67,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Mic.png'),
                      fit: BoxFit.fitWidth),
                ),
              ),
            ),
            Text(
              "Click to Answer",
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Open Sans',
                  fontSize: 18,
                  letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
            SizedBox(height: 30, width: 280),
          ],
        ),
      ),
    );
  }
}

class SemiRoundedBorderButton extends StatelessWidget {
  final BorderSide borderSide;
  final Radius radius;
  final Color background;
  final Widget child;

  const SemiRoundedBorderButton({
    Key? key,
    required this.borderSide,
    required this.radius,
    required this.background,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ClipRect(
      clipper: new SemiRoundedBorderClipper(borderSide.width + 1.0),
      child: new DecoratedBox(
        decoration: new ShapeDecoration(
          color: background,
          shape: new RoundedRectangleBorder(
            side: borderSide,
            borderRadius: new BorderRadius.only(
              topLeft: radius,
              topRight: radius,
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}

class SemiRoundedBorderClipper extends CustomClipper<Rect> {
  final double borderStrokeWidth;

  const SemiRoundedBorderClipper(this.borderStrokeWidth);

  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(
        0.0, 0.0, size.width, size.height - borderStrokeWidth);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    if (oldClipper.runtimeType != SemiRoundedBorderClipper) return true;
    return (oldClipper as SemiRoundedBorderClipper).borderStrokeWidth !=
        borderStrokeWidth;
  }
}
