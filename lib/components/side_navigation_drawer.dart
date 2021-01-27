import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_personal_portfolio/model/navigation_model.dart';
import 'package:my_personal_portfolio/theme.dart';
import 'collapsing_list_tile.dart';
import 'collapsing_profile.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 85;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> withAnimation;
  int currentSelectedTap = 0;
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: drawerBackgorundColor,
        statusBarIconBrightness: Brightness.light));
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    withAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, widget) => getWidget());
  }

  Widget getWidget() {
    return Container(
      width: withAnimation.value,
      color: drawerBackgorundColor,
      child: new Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CollapsingProfile(
            title: "Ali Raza",
            animationController: _animationController,
          ),
          Divider(color: Colors.white70),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, counter) {
                return CollapsingListTile(
                  onTap: () {
                    setState(() {
                      currentSelectedTap = counter;
                    });
                  },
                  isSelected: currentSelectedTap == counter,
                  title: navModel[counter].title,
                  icon: navModel[counter].iconData,
                  animationController: _animationController,
                );
              },
              itemCount: navModel.length,
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
                isCollapsed
                    ? _animationController.forward()
                    : _animationController.reverse();
              });
            },
            child: AnimatedIcon(
              icon: AnimatedIcons.arrow_menu,
              progress: _animationController,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
