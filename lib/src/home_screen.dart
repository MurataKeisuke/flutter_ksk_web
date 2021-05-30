import 'package:flutter/material.dart';
import 'package:flutter_ksk_web/src/web_layout_builder.dart';
import 'package:flutter_ksk_web/src/home_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebLayoutBuilder(
      builder: (context, layout) => layout != WebLayout.slim
          ? _HomeScreenWide(
              title: widget.title,
              counter: _counter,
              incrementCounter: _incrementCounter,
            )
          : _HomeScreenSlim(
              title: widget.title,
              counter: _counter,
              incrementCounter: _incrementCounter,
            ),
    );
  }
}

class _HomeScreenSlim extends StatelessWidget {
  const _HomeScreenSlim({
    required this.title,
    required this.counter,
    required this.incrementCounter,
    Key? key,
  }) : super(key: key);

  final String title;
  final int counter;
  final VoidCallback incrementCounter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: const Drawer(child: HomeMenu()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Screen size: slim',
              style: Theme.of(context).textTheme.headline2,
            ),
            const Text('You have pushed the button this many times:'),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _HomeScreenWide extends StatelessWidget {
  const _HomeScreenWide({
    required this.title,
    required this.counter,
    required this.incrementCounter,
    Key? key,
  }) : super(key: key);

  final String title;
  final int counter;
  final VoidCallback incrementCounter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Drawer(child: HomeMenu()),
        const VerticalDivider(width: 1, thickness: 1),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Screen size: wide',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const Text('You have pushed the button this many times:'),
                  Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
