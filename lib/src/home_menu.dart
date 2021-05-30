import 'package:flutter/material.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  _HomeMenuState createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Header', style: textTheme.headline6),
        ),
        const Divider(height: 1, thickness: 1),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text('Item 1'),
          selected: _selectedDestination == 0,
          onTap: () => selectDestination(0),
        ),
        ListTile(
          leading: const Icon(Icons.delete),
          title: const Text('Item 2'),
          selected: _selectedDestination == 1,
          onTap: () => selectDestination(1),
        ),
        ListTile(
          leading: const Icon(Icons.label),
          title: const Text('Item 3'),
          selected: _selectedDestination == 2,
          onTap: () => selectDestination(2),
        ),
        const Divider(height: 1, thickness: 1),
        const Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Label'),
        ),
        ListTile(
          leading: const Icon(Icons.bookmark),
          title: const Text('Item A'),
          selected: _selectedDestination == 3,
          onTap: () => selectDestination(3),
        ),
      ],
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }
}
