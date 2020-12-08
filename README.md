# KurukkuPattiyal

A new Flutter plugin.

## Usage

The KurukkuPattiyal is a overlay Menu in which is to be built to placed in the center of the right hand side, 
then it's possible to Swipe(Right to left) on indicator to see the menu, And also can change the position of the indicator. 

It is possible to add the menu as Icons and Images, And it is also possible to change the menu Indicator
color as well as menu color.

**Menu**

Each List of Children can have a Icon or Image, which can be customized providing by yourself. If the List of Data parameter is not provided the menu will be not rendered.

**Features**

KurukkuPattiyal widget has more features like List of Menu, Drawer Background Color, Divider Color, Divider Size, Menu Indicator Color, Menu Indicator Size, Menu Indicator Radius and so on..
 
![alt text](https://github.com/RalphNoel/KurukkuPattiyal/blob/main/screenshot/demo.gif)


**Example Usage ( complete with all params ):**

```dart
     import 'package:flutter/material.dart';
     import 'package:kurukkupattiyal/kurukkupattiyal.dart';
     
     void main() {
       runApp(MyApp());
     }
     
     class MyApp extends StatelessWidget {
       @override
       Widget build(BuildContext context) {
         return MaterialApp(
           title: 'Flutter Demo',
           theme: ThemeData(primarySwatch: Colors.blue),
           home: HomeScreen(),
         );
       }
     }
     
     class HomeScreen extends StatefulWidget {
       @override
       _HomeScreenState createState() => _HomeScreenState();
     }
     
     class _HomeScreenState extends State<HomeScreen> {
       List<MenuItem> listOfIcons = List<MenuItem>();
       final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
     
       @override
       void initState() {
         super.initState();
         initalDataLoad();
       }
     
       void showInSnackBar(String value) {
         _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text(value)));
       }
     
       @override
       Widget build(BuildContext context) {
         return Scaffold(
           key: _scaffoldKey,
           appBar: AppBar(
             automaticallyImplyLeading: false,
             title: const Text('குறுக்குபட்டியல்',style: TextStyle(fontWeight: FontWeight.bold),),
           ),
           body: KurukkuPattiyal(
               bodyContent: Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8.0),
                 child: Center(
                   child: buildCard(),
                 ),
               ),
               listOfData: listOfIcons,
               drawerBGColor: Colors.white,
               dragBubbleColor: Colors.black.withOpacity(0.3),
               menuIndicatorColor: Colors.black.withOpacity(0.3),
               onTap: (menuIndex) {
                 print("Click Noel Value : $menuIndex");
                 if (menuIndex == 0) {
                   showInSnackBar('You have Clicked 1st Menu');
     
     
                 } else if (menuIndex == 1) {
                   showInSnackBar('You have Clicked 2nd Menu');
                 } else {
                   showInSnackBar('You have Clicked 3rd Menu');
                 }
               }),
         );
       }
     
       Widget buildCard() {
         return Card(
           color: Colors.deepPurple,
           elevation: 2,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(10.0),
           ),
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               mainAxisSize: MainAxisSize.min,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Center(
                     child: Text(
                       'KurukkuPattiyal \nstands for Cross Menu'.toUpperCase(),
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                         height: 1.5,
                         color: Colors.white,
                       ),
                       overflow: TextOverflow.ellipsis,
                       textAlign: TextAlign.center,
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Center(
                     child: Text(
                       'குறிகாட்டியினை இழுத்து மெனுவை காணலாம்.\n மற்றும் குறிகாட்டியின் இடத்தினையும் மாற்றலாம்.',
                       style: TextStyle(
                         fontSize: 14.0,
                         color: Colors.white,
                         height: 1.5,
                       ),
                       textAlign: TextAlign.center,
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Center(
                     child: Text(
                       'Swipe(Right to left) the indicator to see the menu.\nAnd also can change the position of the indicator.',
                       style: TextStyle(fontSize: 14.0, color: Colors.white, height: 1.5),
                       textAlign: TextAlign.center,
                     ),
                   ),
                 ),
                 SizedBox(
                   height: 10,
                 ),
               ],
             ),
           ),
         );
       }
     
       initalDataLoad() {
         listOfIcons.add(MenuItem(
           icon: Icons.refresh,
           iconColor: Colors.black,
           iconSize: 26.0,
         ));
         listOfIcons.add(MenuItem(image: 'assets/cookie.png', imageColor: Colors.black, isImage: true, imageSize: 5.0));
         listOfIcons.add(MenuItem(image: 'assets/clear_cache.png', imageColor: Colors.black, isImage: true, imageSize: 5.0));
       }
     }

```

## Issues & Feedback

Please file an [issue](https://github.com/RalphNoel/KurukkuPattiyal/issues) to send feedback or report a bug. Thank you!

## Contributing

Every pull request is welcome.