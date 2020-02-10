import 'package:flutter/material.dart';
import 'package:taller_contable/UI/Custom/CollapsingListTile.dart';
import 'package:taller_contable/UI/Custom/ListNavigationIcons.dart';
import 'package:taller_contable/UI/Custom/Theme.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 210, minWidth = 70;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, widget) => Material(
        elevation: 80.0,
        child: Container(
          width: widthAnimation.value,
          color: appBackgroundColor,
          child: Column(
            children: <Widget>[
              CollapsingListTile(
                title: 'User',
                icon: Icons.person,
                animationController: _animationController,
              ),
              Divider(
                color: Colors.grey,
                height: 40.0,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: navigationItems.length,
                  separatorBuilder: (BuildContext context, int counter) =>
                      Divider(
                    height: 12.0,
                  ),
                  itemBuilder: (BuildContext context, int counter) {
                    return CollapsingListTile(
                      title: navigationItems[counter].title,
                      icon: navigationItems[counter].icon,
                      animationController: _animationController,
                      onTap: () {
                        setState(() {
                          currentSelectedIndex = counter;
                        });
                      },
                    );
                  },
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
                  icon: AnimatedIcons.close_menu,
                  progress: _animationController,
                  color: selectedColor,
                  size: 50.0,
                ),
              ),
              SizedBox(
                height: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
