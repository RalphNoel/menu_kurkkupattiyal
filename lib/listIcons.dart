import 'package:flutter/material.dart';

import 'kurukkupattiyal.dart';

class ListofIcons extends StatefulWidget {
  final List<MenuItem> children;
  final Color dividerColor;
  final double dividerSize;
  final Function(int) onTap;
  ListofIcons({Key key, @required this.children, this.dividerColor, this.dividerSize, this.onTap}) : super(key: key);

  @override
  _ListofIconsState createState() => _ListofIconsState();
}

class _ListofIconsState extends State<ListofIcons> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: widget.children.length,
        separatorBuilder: (context, i) {
          return Column(
            children: [
              Divider(
                color: widget.dividerColor,
                thickness: widget.dividerSize,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          );
        },
        itemBuilder: (context, int i) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  widget.onTap(i);
                },
                child: widget.children[i].isImage
                    ? Image.asset(
                        widget.children[i].image,
                        scale: widget.children[i].imageSize,
                        color: widget.children[i].imageColor,
                      )
                    : Icon(
                        widget.children[i].icon,
                        size: widget.children[i].iconSize,
                        color: widget.children[i].iconColor,
                      ),
              ),
            ],
          );
        });
  }
}
