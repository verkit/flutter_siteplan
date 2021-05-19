import 'package:flutter/material.dart';
import 'package:flutter_siteplan/widget/kavling_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Kavling {
  double x;
  double y;
  String shapes = '';
}

class _MyHomePageState extends State<MyHomePage> {
  List<Offset> pointkus = List<Offset>.empty(growable: true);
  int buttonState = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pointkus.add(Offset(356, 347));
    pointkus.add(Offset(330, 347));
    pointkus.add(Offset(325, 345));
    pointkus.add(Offset(338, 309));
    pointkus.add(Offset(356, 309));
  }

  int _groupKavling = -1;
  double scale = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Siteplan',
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      scale = 1;
                      setState(() {});
                    },
                    child: Text('x1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      scale = 1.5;
                      setState(() {});
                    },
                    child: Text('x1,5'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      scale = 2;
                      setState(() {});
                    },
                    child: Text('x2'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                color: Colors.yellow,
                child: InteractiveViewer(
                  constrained: false,
                  child: Stack(
                    children: [
                      Container(
                        height: 744 * scale,
                        width: 1052 * scale,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                            'assets/images/kavling saja 2.png', /*width: 1052, height: 744,*/
                          ),
                          fit: BoxFit.fill,
                        )),
                        //child: Image.asset('assets/images/kavling.png', /*width: 1052, height: 744,*/)
                      ),
                      KavlingWidget(
                        scale: scale,
                        value: 0,
                        groupKavling: _groupKavling,
                        pointkus: pointkus,
                        color0: Colors.green,
                        color1: Colors.green.withOpacity(0.5),
                        color2: Colors.orange,
                        shapes: 'polygon',
                        x: 320,
                        y: 309,
                        width: 35 * scale,
                        height: 35 * scale,
                        onChanged: (value) {
                          _groupKavling = value;
                          setState(() {});
                        },
                        onTap: () {},
                      ),
                      KavlingWidget(
                        scale: scale,
                        value: 1,
                        groupKavling: _groupKavling,
                        x: 357,
                        y: 309,
                        width: 19,
                        height: 38,
                        color0: Colors.blue,
                        color1: Colors.blue.withOpacity(0.5),
                        color2: Colors.orange,
                        shapes: 'rect',
                        onChanged: (value) {
                          _groupKavling = value;
                          setState(() {});
                        },
                        onTap: () {},
                      ),
                      KavlingWidget(
                        scale: scale,
                        value: 2,
                        groupKavling: _groupKavling,
                        x: 377,
                        y: 309,
                        width: 18,
                        height: 38,
                        color0: Colors.blue,
                        color1: Colors.blue.withOpacity(0.5),
                        color2: Colors.orange,
                        shapes: 'rect',
                        onChanged: (value) {
                          _groupKavling = value;
                          setState(() {});
                        },
                        onTap: () {},
                      ),
                      KavlingWidget(
                        scale: scale,
                        value: 3,
                        groupKavling: _groupKavling,
                        x: 396,
                        y: 309,
                        width: 19,
                        height: 38,
                        color0: Colors.red,
                        color1: Colors.red.withOpacity(0.5),
                        color2: Colors.red,
                        shapes: 'rect',
                        onChanged: (value) {
                          _groupKavling = value;
                          setState(() {});
                        },
                        onTap: () {},
                      ),
                      KavlingWidget(
                        scale: scale,
                        x: 416,
                        y: 309,
                        value: 4,
                        groupKavling: _groupKavling,
                        width: 18.5,
                        height: 38,
                        color0: Colors.blue,
                        color1: Colors.blue.withOpacity(0.5),
                        color2: Colors.orange,
                        shapes: 'rect',
                        onChanged: (value) {
                          _groupKavling = value;
                          setState(() {});
                        },
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
