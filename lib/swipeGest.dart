import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

// This Class For SwipeGesture
@immutable
// ignore: must_be_immutable
class SwipeGest extends StatefulWidget {
  SwipeGest({
    Key key,
    @required this.dragStart,
    @required this.triggered,
    @required this.isWidth,
    @required this.endDeltaValue,
    @required GlobalKey<ScaffoldState> drawerKey,
    @required this.valueListener,
    @required this.dragBubbleColor,
    @required this.menuIndicatorColor,
    this.menuIndicatorSize,
    this.menuIndicatorSizeWidth,
    this.dragBubbleSizeWidth,
    this.dragBubbleRadius,
    this.menuIndicatorRadius,
  })  : _drawerKey = drawerKey,
        super(key: key);

  int dragStart;
  int triggered;
  bool isWidth;
  int endDeltaValue;
  final GlobalKey<ScaffoldState> _drawerKey;
  final ValueNotifier<double> valueListener;
  final Color dragBubbleColor;
  final Color menuIndicatorColor;
  final double menuIndicatorSize;
  final double menuIndicatorSizeWidth;
  final double dragBubbleSizeWidth;
  final double dragBubbleRadius;
  final double menuIndicatorRadius;
  @override
  _SwipeGestState createState() => _SwipeGestState();
}

class _SwipeGestState extends State<SwipeGest> {
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        AllowMultipleHorizontalDragGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<AllowMultipleHorizontalDragGestureRecognizer>(
          () => AllowMultipleHorizontalDragGestureRecognizer(),
          (AllowMultipleHorizontalDragGestureRecognizer instance) {
            instance.onStart = (DragStartDetails startdetails) {
              print('Horizontal Start');
              widget.dragStart = startdetails.sourceTimeStamp.inMilliseconds;
              widget.triggered = 0;
            };
            instance.onUpdate = (DragUpdateDetails updatedetails) {
              print('Horizontal Update');
              int dragCurr = updatedetails.sourceTimeStamp.inMilliseconds;

              if ((dragCurr - widget.dragStart) >= 500 && widget.triggered == 0) {
                setState(() {
                  if (widget.isWidth == false) {
                    widget.isWidth = true;
                  }
                });
                widget.triggered = 1;
              }
              widget.endDeltaValue = dragCurr - widget.dragStart;
            };
            instance.onEnd = (DragEndDetails endDetails) {
              print('Horizontal Drag End');
              setState(() {
                if (widget.isWidth == true) {
                  widget.isWidth = false;
                  // dragVer = 0;
                }
              });
              if (widget.endDeltaValue <= 500) {
                widget._drawerKey.currentState.openEndDrawer();
              }
            };
          },
        )
      },
      child: RawGestureDetector(
        gestures: {
          AllowMultipleVerticalDragGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<AllowMultipleVerticalDragGestureRecognizer>(
            () => AllowMultipleVerticalDragGestureRecognizer(),
            (AllowMultipleVerticalDragGestureRecognizer instance) {
              instance.onUpdate = (details) {
                if (widget.isWidth == true) {
                  widget.valueListener.value =
                      (widget.valueListener.value + details.delta.dy / context.size.height).clamp(.0, 1.0);
                  print(widget.valueListener.value);
                  print(widget.isWidth);
                } else {
                  widget.isWidth = false;
                }
              };
              instance.onEnd = (details) {
                setState(() {
                  widget.isWidth = false;
                });
              };
            },
          )
        },
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: AnimatedBuilder(
            animation: widget.valueListener,
            builder: (context, child) {
              return Align(
                alignment: Alignment(
                  1,
                  widget.valueListener.value * 2 - 1,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 65,
                      width: widget.isWidth ? 44 : 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      height: widget.menuIndicatorSize,
                      width: widget.isWidth ? widget.dragBubbleSizeWidth : widget.menuIndicatorSizeWidth,
                      decoration: BoxDecoration(
                        color: widget.isWidth ? widget.dragBubbleColor : widget.menuIndicatorColor,
                        borderRadius: widget.isWidth
                            ? BorderRadius.circular(widget.dragBubbleRadius)
                            : BorderRadius.circular(widget.menuIndicatorRadius),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// This Class For Allow to User to Drag Vertical
class AllowMultipleVerticalDragGestureRecognizer extends VerticalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

// This Class For Allow to User to Drag Horizontal
class AllowMultipleHorizontalDragGestureRecognizer extends HorizontalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
