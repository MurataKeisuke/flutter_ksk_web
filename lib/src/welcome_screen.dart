import 'package:flutter/material.dart';
import 'package:flutter_ksk_web/src/web_layout_builder.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: WebLayoutBuilder(
          builder: (context, layout) => layout != WebLayout.slim
              ? _WelcomeScreenWide(
                  counter: _counter,
                )
              : _WelcomeScreenSlim(
                  counter: _counter,
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _WelcomeScreenSlim extends StatelessWidget {
  const _WelcomeScreenSlim({
    required this.counter,
    Key? key,
  }) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class _WelcomeScreenWide extends StatelessWidget {
  const _WelcomeScreenWide({
    required this.counter,
    Key? key,
  }) : super(key: key);

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
