import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Theme',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 6, right: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 15,
                          child: Icon(
                            Icons.account_circle,
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text('userEmail'),
                        SizedBox(width: 10),
                        IconButton(icon: Icon(Icons.logout), onPressed: null),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                color: Colors.blueAccent,
                thickness: 1,
              ),
            ],
          ),
        ),
        floatingActionButton: Visibility(
          child: FloatingActionButton(
            onPressed: () => null,
            tooltip: 'New Project',
            child: const Icon(Icons.add),
          ),
        ));
  }
}
