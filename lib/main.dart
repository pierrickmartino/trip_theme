import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key, this.savedThemeMode}) : super(key: key);

  final AdaptiveThemeMode savedThemeMode;

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightThemeData,
      dark: darkThemeData,
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trip Theme',
        theme: theme,
        darkTheme: darkTheme,
        home: const MyHomePage(title: 'Home Page'),
      ),
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
                      children: [
                        IconButton(
                            icon: const Icon(Icons.brightness_medium),
                            onPressed: () {
                              AdaptiveTheme.of(context).toggleThemeMode();
                            }),
                        const CircleAvatar(
                          radius: 15,
                          child: Icon(
                            Icons.account_circle,
                            size: 30,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text('userEmail'),
                        const SizedBox(width: 10),
                        const IconButton(
                            icon: Icon(Icons.logout), onPressed: null),
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
