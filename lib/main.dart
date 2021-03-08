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
    bool _giveVerse = true;

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
                        IconButton(
                            icon: const Icon(Icons.brightness_medium),
                            onPressed: () {
                              AdaptiveTheme.of(context).toggleThemeMode();
                            }),
                        IconButton(
                            icon: const Icon(Icons.logout),
                            onPressed: () {
                              print('logout');
                            }),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                color: Colors.blueAccent,
                thickness: 1,
              ),
              Wrap(
                spacing: 10,
                children: const [
                  Chip(avatar: Text('A'), label: Text('label1')),
                  Chip(avatar: Text('B'), label: Text('label2')),
                  Chip(avatar: Text('C'), label: Text('label3')),
                  Chip(avatar: Text('D'), label: Text('label4')),
                  Chip(avatar: Text('E'), label: Text('label5')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Wrap(
                  spacing: 10,
                  children: [
                    const OutlinedButton(
                      onPressed: null,
                      child: Text('OutlinedButton'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        print('OutlinedButton');
                      },
                      child: const Text('OutlinedButton'),
                    ),
                    TextButton(
                      onPressed: () {
                        print('TextButton');
                      },
                      child: const Text('TextButton'),
                    ),
                    MaterialButton(
                      onPressed: () {
                        print('MaterialButton');
                      },
                      child: const Text('MaterialButton'),
                    )
                  ],
                ),
              ),
              Text('headline1', style: Theme.of(context).textTheme.headline1),
              Text('headline2', style: Theme.of(context).textTheme.headline2),
              Text('headline3', style: Theme.of(context).textTheme.headline3),
              Text('headline4', style: Theme.of(context).textTheme.headline4),
              Text('headline5', style: Theme.of(context).textTheme.headline5),
              Text('headline6', style: Theme.of(context).textTheme.headline6),
              Text('subtitle1', style: Theme.of(context).textTheme.subtitle1),
              Text('subtitle2', style: Theme.of(context).textTheme.subtitle2),
              Text('bodyText1', style: Theme.of(context).textTheme.bodyText1),
              Text('bodyText2', style: Theme.of(context).textTheme.bodyText2),
              Switch(
                  value: _giveVerse,
                  onChanged: (bool newValue) {
                    setState(() {
                      _giveVerse = newValue;
                    });
                  }),
              const Padding(
                padding: EdgeInsets.all(5),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Text('Leading'),
                    title: Text('Title'),
                    subtitle: Text('Subtitle'),
                    isThreeLine: true,
                    trailing: Text('Trailing'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Text('Leading'),
                    title: Text('Title'),
                    subtitle: Text('Subtitle'),
                    isThreeLine: true,
                    trailing: Text('Trailing'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: Card(
                  elevation: 4,
                  child: ListTile(
                    leading: Text('Leading'),
                    title: Text('Title'),
                    subtitle: Text('Subtitle'),
                    isThreeLine: true,
                    trailing: Text('Trailing'),
                  ),
                ),
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
