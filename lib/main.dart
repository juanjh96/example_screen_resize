import 'package:flutter/material.dart';
import 'package:resize_tablet/resize.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        ///add [BuilderMaterialApp.resizeTablet] in builder attribute for this to work
        builder: BuilderMaterialApp.resizeTablet,
        title: 'Material App',
        home: PageExample1(),
      ),
    );
  }
}

class PageExample1 extends StatelessWidget {
  const PageExample1({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(
                color: Colors.green,
                width: 10,
              ),
            ),
            height: 365.5,
            child: const Center(
              child: Text('static value 365.5'),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(
                color: Colors.yellow,
                width: 10,
              ),
            ),
            height: 365.5,
            child: const Center(
              child: Text('static value 365.5'),
            ),
          )
        ],
      ),
    );
  }
}
