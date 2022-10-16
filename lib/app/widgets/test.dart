import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Auto Text'),
      ),
      body: Stack(
        children: [
          ClipPath(
            clipper: ProsteBezierCurve(
              position: ClipPosition.bottom,
              list: [
                BezierCurveSection(
                  start: const Offset(0, 125),
                  top: const Offset(400 / 4, 150),
                  end: const Offset(400 / 2, 125),
                ),
                BezierCurveSection(
                  start: const Offset(400 / 2, 125),
                  top: const Offset(400 / 4 * 3, 100),
                  end: const Offset(400, 150),
                ),
              ],
            ),
            child: Container(
              height: 200,
              color: Colors.redAccent,
              child: Text('Test'),
              alignment: Alignment.center,
            ),

          ),
        ],
      ),
    );
  }
}
