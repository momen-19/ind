import 'package:floating_frosted_bottom_bar/app/frosted_bottom_bar.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: FrostedBottomBar(
        opacity: 0.6,
        sigmaX: 5,
        sigmaY: 5,
        borderRadius: BorderRadius.circular(500),
        duration: const Duration(milliseconds: 800),
        hideOnScroll: true,
        body: (context, controller) => TabBarView(
          controller: tabController,
          dragStartBehavior: DragStartBehavior.down,
          physics: const BouncingScrollPhysics(),
          children: colors
              .map(
                (e) => ListView.builder(
                  itemCount: 5,
                  controller: controller,
                  itemBuilder: (context, index) {
                    return const Card(child: FittedBox(child: Text('123')));
                  },
                ),
              )
              .toList(),
        ),
        child: TabBar(
          indicatorPadding: EdgeInsets.fromLTRB(6, 0, 6, 0),
          controller: tabController,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.blue, width: 4),
            insets: EdgeInsets.fromLTRB(16, 0, 16, 8),
          ),
          tabs: [
            TabsIcon(
                icons: Icons.home,
                color: currentPage == 0 ? colors[0] : Colors.white.withOpacity(0.5)),
            TabsIcon(
                icons: Icons.search,
                color: currentPage == 1 ? colors[1] : Colors.white),
            TabsIcon(
                icons: Icons.queue_play_next,
                color: currentPage == 2 ? colors[2] : Colors.white),
            TabsIcon(
                icons: Icons.file_download,
                color: currentPage == 3 ? colors[3] : Colors.white),
            TabsIcon(
                icons: Icons.menu,
                color: currentPage == 4 ? colors[4] : Colors.white),
          ],
        ),
      ),
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
