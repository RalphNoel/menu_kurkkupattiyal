import 'package:flutter/material.dart';

import 'listIcons.dart';
import 'kurukkupattiyal.dart';

class AlignBuildDrawer extends StatefulWidget {
  const AlignBuildDrawer(
      {Key key,
      @required this.listOfContent,
      @required this.valueListener,
      @required this.drawerBGColor,
      this.dividerColor,
      this.dividerSize,
      this.menuIndicatorColor,
      this.onTap})
      : super(key: key);

  final ValueNotifier<double> valueListener;
  final List<MenuItem> listOfContent;
  final Color drawerBGColor;
  final Color dividerColor;
  final double dividerSize;
  final Color menuIndicatorColor;
  final Function(int) onTap;

  @override
  _AlignBuildDrawerState createState() => _AlignBuildDrawerState();
}

class _AlignBuildDrawerState extends State<AlignBuildDrawer> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(
        1,
        widget.valueListener.value * 2 - 1,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 18.0, top: 10.0, bottom: 10.0),
        child: Container(
          width: 62,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            color: widget.drawerBGColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListofIcons(
            children: widget.listOfContent,
            dividerColor: widget.dividerColor,
            dividerSize: widget.dividerSize,
            onTap: widget.onTap,
          ),
        ),
      ),
    );
  }
}
