import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taller_contable/Provider/Bloc/AlmacenBloc.dart';
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
  bool isCollapsed;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: minWidth, end: maxWidth)
        .animate(_animationController);
    isCollapsed = true;
    super.initState();
  }
  void setChangeIndex(int nu){
    Provider.of<AlmacenBloc>(context,listen: false).setIndicePagina(nu);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      child: Text('data'),
      animation: _animationController,
      builder: (BuildContext context, widget) => Material(
        elevation: 80.0,
        child: Container(
          width: widthAnimation.value,
          color: appBackgroundColor,
          child: Column(
            children: <Widget>[
              CollapsingListTile(
                title: 'Taller',
                icon: Icons.money_off,
                animationController: _animationController,
                // isSelected: true,
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
                      isSelected: currentSelectedIndex == counter,
                      onTap: () {
                        setState(() {
                          currentSelectedIndex = counter;
                          // setChangeIndex(currentSelectedIndex);
                          Provider.of<AlmacenBloc>(context,listen: false).setIndicePagina(currentSelectedIndex);
                          // isCollapsed = true;
                          isCollapsed ? _animationController.reverse() : null;
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
                  icon: AnimatedIcons.home_menu,
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
