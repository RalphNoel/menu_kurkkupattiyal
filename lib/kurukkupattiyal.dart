// You have generated a new plugin project without
// specifying the `--platforms` flag. A plugin project supports no platforms is generated.
// To add platforms, run `flutter create -t plugin --platforms <platforms> .` under the same
// directory. You can also find a detailed instruction on how to add platforms in the `pubspec.yaml` at https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'package:flutter/material.dart';
import 'package:menu_kurukkupattiyal/swipeGest.dart';
import 'alignDrawer.dart';

class KurukkuPattiyalMenu extends StatefulWidget {
  // மெனு படங்களின் பட்டியலைக் காட்டுகிறது
  // Showing List of Icons and Images
  final List<MenuItem> listOfData;

  // மெனுவின் பின்னணி நிறம்
  // The Color of the background Drawer
  final Color drawerBGColor;

  // பிரிப்பான் நிறத்தின் நிறம்
  // The Color of the Divider
  final Color dividerColor;

  // பிரிப்பானின் அளவு
  // The Size of the Divider
  final double dividerSize;

  // மெனுவின் நிறம்
  // The Color of the Menu Indicator
  final Color menuIndicatorColor;

  // மெனுவின் அளவு
  // The Size of the Menu Indicator
  final double menuIndicatorSize;

  // மெனுவின் அகலம்
  // The Width of the Menu Indicator
  final double menuIndicatorSizeWidth;

  // மெனுவின் ஆரம்
  // The Radius of the Menu Indicator
  final double menuIndicatorRadius;

  // இடம் மாற்று மெனுவின் அளவு
  // The Size of the Dragging Bubble
  final double dragBubbleSize;

  // இடம் மாற்று மெனுவின் அகலம்
  // The Width of the Dragging Bubble
  final double dragBubbleSizeWidth;

  // இடம் மாற்று மெனுவின் நிறம்
  // The Color of the Dragging Bubble
  final Color dragBubbleColor;

  // இடம் மாற்று மெனுவின் ஆரம்
  // The Radius of the Dragging Bubble
  final double dragBubbleRadius;

  // மெனுவின் ஆரம்ப நிலை
  // The Position of the Menu Indicator
  final double indicatorDefaultPosition;

  // மெனுவை அழுத்தும் போது செயல்படுத்தப்படுவது
  // Executed When the menu is Pressed
  final Function(int) onTap;

  // ஸ்கேப்போல்டு விட்ஜெட் உட்பிரிவு
  // Body content of the scaffold
  final Widget bodyContent;

  const KurukkuPattiyalMenu({
    Key key,
    @required this.listOfData,
    this.drawerBGColor =  Colors.white,
    this.dividerColor,
    this.dividerSize,
    this.menuIndicatorColor = Colors.black,
    this.menuIndicatorSize = 65,
    this.menuIndicatorSizeWidth = 9,
    this.menuIndicatorRadius = 10,
    this.dragBubbleSizeWidth = 24,
    this.dragBubbleRadius = 20,
    this.dragBubbleSize,
    this.dragBubbleColor = Colors.black,
    this.indicatorDefaultPosition = 0.5,
    this.onTap,
    this.bodyContent,
  }) : super(key: key);

  @override
  _KurukkuPattiyalMenuState createState() => _KurukkuPattiyalMenuState();
}

class _KurukkuPattiyalMenuState extends State<KurukkuPattiyalMenu> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  bool isWidth = false;
  int dragStart = 0;
  int triggered = 0;
  int endDeltaValue = 0;
  ValueNotifier<double> valueListener;

  @override
  Widget build(BuildContext context) {
    valueListener = ValueNotifier(widget.indicatorDefaultPosition);
    return Scaffold(
      drawerScrimColor: Colors.grey.withOpacity(0.5),
      endDrawer: buildDrawer(context),
      drawerEdgeDragWidth: 0,
      key: _drawerKey,
      body: Stack(
        children: [
          widget.bodyContent,
          SwipeGest(
            drawerKey: _drawerKey,
            valueListener: valueListener,
            dragStart: dragStart,
            endDeltaValue: endDeltaValue,
            isWidth: isWidth,
            triggered: triggered,
            dragBubbleColor: widget.dragBubbleColor,
            dragBubbleSizeWidth: widget.dragBubbleSizeWidth,
            dragBubbleRadius: widget.dragBubbleRadius,
            menuIndicatorColor: widget.menuIndicatorColor,
            menuIndicatorSize: widget.menuIndicatorSize,
            menuIndicatorSizeWidth: widget.menuIndicatorSizeWidth,
            menuIndicatorRadius: widget.menuIndicatorRadius,
          ),
        ],
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return AlignBuildDrawer(
        valueListener: valueListener,
        listOfContent: widget.listOfData,
        drawerBGColor: widget.drawerBGColor,
        dividerSize: widget.dividerSize,
        dividerColor: widget.dividerColor,
        onTap: widget.onTap);
  }
}

// ஒரு மெனுவின் தரவை வழங்குகிறது
// Provides data For a Menu
class MenuItem {
  IconData icon;
  final double iconSize;
  final Color iconColor;
  final String image;
  final double imageSize;
  final Color imageColor;
  final bool isImage;
  MenuItem(
      {this.icon, this.iconSize, this.iconColor, this.image, this.imageSize, this.imageColor, this.isImage = false});
}
