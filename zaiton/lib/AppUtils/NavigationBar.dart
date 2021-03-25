import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:zaiton/AppUtils/ZThemes.dart';
import 'package:zaiton/Screens/AddOutlet.dart';
import 'package:zaiton/Screens/Home.dart';
import 'package:zaiton/Screens/Order.dart';
import 'package:zaiton/Screens/Returns.dart';

class NavigatonBar extends StatefulWidget {
  NavigatonBar({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _NavigatonBarState createState() => _NavigatonBarState();
}

class _NavigatonBarState extends State<NavigatonBar> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.red,
          handleAndroidBackButtonPress: true,
          screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 500),
          ),
          onItemSelected: (int) {
            setState(() {});
          },
          customWidget: CustomNavBarWidget(
            items: _navBarsItems(),
            onItemSelected: (index) {
              setState(() {
                _controller.index = index;
              });
            },
            selectedIndex: _controller.index,
          ),
          itemCount: 4,
          navBarStyle: NavBarStyle.custom),
    );
  }

  List<Widget> _buildScreens() {
    return [
      Home(),
      Order(),
      Returns(),
      AddOutlet(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
          size: 32,
        ),
        title: ("Home"),
        titleFontSize: 10,
        activeColor: ZThemes.appTheme,
        inactiveColor: ZThemes.darkTheme,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.category,
          size: 32,
        ),
        title: ("Orders"),
        titleFontSize: 10,
        activeColor: ZThemes.appTheme,
        inactiveColor: ZThemes.darkTheme,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.favorite,
          size: 32,
        ),
        title: ("Returns"),
        titleFontSize: 10,
        activeColor: ZThemes.appTheme,
        inactiveColor: ZThemes.darkTheme,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.search,
          size: 32,
        ),
        title: ("Add Outlet"),
        titleFontSize: 10,
        activeColor: ZThemes.appTheme,
        inactiveColor: ZThemes.darkTheme,
      ),
    ];
  }
}

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget({
    Key key,
    this.selectedIndex,
    @required this.items,
    this.onItemSelected,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: 60.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 26.0,
                  color: isSelected
                      ? (item.activeContentColor == null
                          ? item.activeColor
                          : item.activeContentColor)
                      : item.inactiveColor == null
                          ? item.activeColor
                          : item.inactiveColor),
              child: item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                item.title,
                style: TextStyle(
                    color: isSelected
                        ? (item.activeContentColor == null
                            ? item.activeColor
                            : item.activeContentColor)
                        : item.inactiveColor,
                    fontWeight: FontWeight.w400,
                    fontSize: item.titleFontSize),
              )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Container(
        width: double.infinity,
        height: 60.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            var index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  this.onItemSelected(index);
                },
                child: _buildItem(item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
