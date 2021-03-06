import 'dart:math' as math;
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:expandable/expandable.dart';
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
    double _currentSliderValue = 20;

    return Scaffold(
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                const HeaderInfoExample(),
                const Divider(
                  color: Colors.blueAccent,
                  thickness: 1,
                ),
                ExpandableTheme(
                  data: const ExpandableThemeData(
                    iconColor: Colors.blue,
                    useInkWell: true,
                  ),
                  child: const ExpandableResultCard(
                    title: 'France',
                    score: '3',
                    headerColor: Colors.teal,
                  ),
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
                          // ignore: avoid_print
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content:
                                  Text('OutlinedButton successfully created'),
                            ),
                          );
                        },
                        child: const Text('OutlinedButton'),
                      ),
                      TextButton(
                        onPressed: () {
                          // ignore: avoid_print
                          print('TextButton');
                        },
                        child: const Text('TextButton'),
                      ),
                      MaterialButton(
                        onPressed: () {
                          // ignore: avoid_print
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
                Slider(
                  value: _currentSliderValue,
                  //min: 0,
                  max: 100,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
                const CardExample(),
                const CardExample(),
                const CardExample(),
              ],
            ),
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

class HeaderInfoExample extends StatelessWidget {
  const HeaderInfoExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    // ignore: avoid_print
                    print('logout');
                  }),
            ],
          )
        ],
      ),
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
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
    );
  }
}

class ExpandableSubResultCard extends StatelessWidget {
  const ExpandableSubResultCard(
      {Key key, this.title, this.code, this.score, this.headerColor})
      : super(key: key);

  final String title;
  final String score;
  final String code;
  final Color headerColor;

  @override
  Widget build(BuildContext context) {
    Widget _buildItem(String labelLeft, String labelRight) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Text(labelLeft),
            const Spacer(),
            Text(labelRight),
          ],
        ),
      );
    }

    // Widget _buildList() {
    //   return Column(
    //     children: <Widget>[
    //       for (var i in [1, 2, 3, 4]) _buildItem('Item $i', ''),
    //     ],
    //   );
    // }

    Widget _buildContent() {
      switch (code) {
        case 'WEATHER':
          return Column(
            children: <Widget>[
              _buildItem('Temperature min.', '12??C'),
              _buildItem('Temperature max.', '20??C'),
              _buildItem('Precipitation', '120mm')
            ],
          );
          break;
        case 'SECURITY':
          return Column(
            children: <Widget>[
              _buildItem('Terrorist Risk', 'Low'),
              _buildItem('Health Risk', 'Low'),
            ],
          );
          break;
        case 'DISTANCE':
          return Column(
            children: <Widget>[
              _buildItem('Distance calculation', 'Low'),
            ],
          );
          break;
        case 'INTEREST':
          return Column(
            children: <Widget>[
              _buildItem('Adequation with your interests', 'High'),
            ],
          );
          break;
        case 'BUDGET':
          return Column(
            children: <Widget>[
              _buildItem('Budget compatibility', 'High'),
            ],
          );
          break;
        default:
          return Column(
            children: <Widget>[
              for (var i in [1, 2, 3, 4]) _buildItem('Item $i', ''),
            ],
          );
      }
    }

    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToExpand: true,
                    tapBodyToCollapse: true,
                    hasIcon: false,
                  ),
                  header: Container(
                    color: headerColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          ExpandableIcon(
                            theme: const ExpandableThemeData(
                              expandIcon: Icons.arrow_right,
                              collapseIcon: Icons.arrow_drop_down,
                              iconColor: Colors.white,
                              iconSize: 28,
                              iconRotationAngle: math.pi / 2,
                              iconPadding: EdgeInsets.only(right: 5),
                              hasIcon: false,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: Colors.white),
                                ),
                                const Spacer(),
                                Text(
                                  '$score / 5',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  expanded: _buildContent(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExpandableResultCard extends StatelessWidget {
  const ExpandableResultCard(
      {Key key, this.title, this.score, this.headerColor})
      : super(key: key);

  final String title;
  final String score;
  final Color headerColor;

  @override
  Widget build(BuildContext context) {
    Widget buildScoringResult() {
      return Column(
        children: <Widget>[
          ExpandableTheme(
            data: const ExpandableThemeData(
              iconColor: Colors.blue,
              useInkWell: true,
            ),
            child: const ExpandableSubResultCard(
              title: 'Weather',
              code: 'WEATHER',
              score: '4',
              headerColor: Colors.indigoAccent,
            ),
          ),
          ExpandableTheme(
            data: const ExpandableThemeData(
              iconColor: Colors.red,
              useInkWell: true,
            ),
            child: const ExpandableSubResultCard(
              title: 'Security',
              code: 'SECURITY',
              score: '3',
              headerColor: Colors.indigoAccent,
            ),
          ),
          ExpandableTheme(
            data: const ExpandableThemeData(
              iconColor: Colors.red,
              useInkWell: true,
            ),
            child: const ExpandableSubResultCard(
              title: 'Distance',
              code: 'DISTANCE',
              score: '3',
              headerColor: Colors.indigoAccent,
            ),
          ),
          ExpandableTheme(
            data: const ExpandableThemeData(
              iconColor: Colors.red,
              useInkWell: true,
            ),
            child: const ExpandableSubResultCard(
              title: 'Interest',
              code: 'INTEREST',
              score: '3',
              headerColor: Colors.indigoAccent,
            ),
          ),
          ExpandableTheme(
            data: const ExpandableThemeData(
              iconColor: Colors.red,
              useInkWell: true,
            ),
            child: const ExpandableSubResultCard(
              title: 'Budget',
              code: 'BUDGET',
              score: '3',
              headerColor: Colors.indigoAccent,
            ),
          ),
        ],
      );
    }

    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: ScrollOnExpand(
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: <Widget>[
                ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToExpand: true,
                    tapBodyToCollapse: true,
                    hasIcon: false,
                  ),
                  header: Container(
                    color: headerColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          ExpandableIcon(
                            theme: const ExpandableThemeData(
                              expandIcon: Icons.arrow_right,
                              collapseIcon: Icons.arrow_drop_down,
                              iconColor: Colors.white,
                              iconSize: 28,
                              iconRotationAngle: math.pi / 2,
                              iconPadding: EdgeInsets.only(right: 5),
                              hasIcon: false,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: Colors.white),
                                ),
                                const Spacer(),
                                Text(
                                  '$score / 5',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  expanded: buildScoringResult(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
