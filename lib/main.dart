import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool status = true;
  double _height = 100.0;
  double _width = 100.0;
  double _padingValue = 40.0;
  double _marginValue = 0.0;
  Alignment _alignment = Alignment.center;
  Matrix4 _matrix4 = Matrix4.translationValues(0, 0, 0);
  Color _color = Colors.amber;

  @override
  void initState() {
    super.initState();
  }

  void _animating() {
    setState(() {
      if (status) {
        _height = 100.0;
        _width = 100.0;
        _color = Colors.amber;
        _padingValue = 40.0;
        _marginValue = 0.0;
        _alignment = Alignment.center;
        _matrix4 = Matrix4.translationValues(0, 0, 0);
      } else {
        _height = 200.0;
        _width = 200.0;
        _padingValue = 30.0;
        _marginValue = 30.0;
        _color = Colors.blue;
        _alignment = Alignment.bottomRight;
        _matrix4 = Matrix4.translationValues(20, 50, 0);
      }
      status = !status;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _animating,
              child: Center(
                child: AnimatedCrossFade(
                  firstChild: Container(
                    width: 200,
                    height: 200,
                    child: Text(
                      "第一个子widget",
                      style: TextStyle(
                          backgroundColor: Colors.deepOrange, fontSize: 30),
                    ),
                  ),
                  secondChild: Text(
                    "第二个子widget",
                    style: TextStyle(
                        backgroundColor: Colors.blueAccent, fontSize: 30),
                  ),
                  crossFadeState: status
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 500),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _animating,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
