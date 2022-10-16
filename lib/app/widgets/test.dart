import 'package:animation_search_bar/animation_search_bar.dart';
import 'package:floating_frosted_bottom_bar/app/frosted_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;
  final List<Color> colors = [
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.blue
  ];
  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(
          () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CupertinoButton(
                  color: Colors.blueAccent,
                  pressedOpacity: .75,
                  child: Text('SideMenuAnimation'),
                  onPressed: () => _goToExample(context, SideMenuScreen()),
                ),
                const SizedBox(height: 20),
                CupertinoButton(
                  color: Colors.blueAccent,
                  pressedOpacity: .75,
                  child: const Text('SideMenuAnimation.builder'),
                  onPressed: () => _goToExample(context, SideMenuBuilderScreen()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _goToExample(BuildContext context, Widget newPage) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => newPage));
}

class SideMenuBuilderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      color: Colors.teal,
    );
  }
}
class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('123'),
        Text('123'),
        Text('123'),
        Text('123'),
        Text('123'),
        Text('123'),
      ],
    );
  }
}

class TabsIcon extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final IconData icons;

  const TabsIcon(
      {Key? key,
      this.color = Colors.white,
      this.height = 60,
      this.width = 50,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: Icon(
          icons,
          color: color,
        ),
      ),
    );
    ;
  }
}
