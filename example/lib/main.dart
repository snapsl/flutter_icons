import 'package:flutter/material.dart';
import 'package:tabler_icons/tabler_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var tablerIcons = [
      TablerIcons.alarm,
      TablerIcons.album,
      TablerIcons.mail,
      TablerIcons.run,
    ];

    final iconList = [...tablerIcons];

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 840),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
            ),
            itemCount: iconList.length,
            itemBuilder: (context, index) => Card(child: Icon(iconList[index])),
          ),
        ),
      ),
    );
  }
}
