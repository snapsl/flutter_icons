import 'package:ant_design_icons/ant_design_icons.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:tabler_icons/tabler_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.orange)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const tablerIcons = [
      TablerIcons.brandTabler,
      TablerIcons.album,
      TablerIcons.mail,
      TablerIcons.mail_filled,
    ];

    const simpleIcons = [
      SimpleIcons.simpleicons,
      SimpleIcons.cesium,
      SimpleIcons.flutter,
      SimpleIcons.homeassistant,
    ];

    const lucidIcons = [
      LucideIcons.album,
      LucideIcons.ban,
      LucideIcons.diamond,
      LucideIcons.squareMenu,
    ];

    const antDesignIcons = [
      AntDesignIcons.antDesign_outlined,
      AntDesignIcons.facebook_filled,
      AntDesignIcons.accountBook_filled,
      AntDesignIcons.bug_filled,
    ];

    const bootstrapIcons = [
      BootstrapIcons.bootstrap,
      BootstrapIcons.activity,
      BootstrapIcons.dashCircleFill,
      BootstrapIcons.magic,
    ];

    final iconList = [
      ...tablerIcons,
      ...simpleIcons,
      ...lucidIcons,
      ...antDesignIcons,
      ...bootstrapIcons,
    ];

    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(title: Text('Flutter Icons Example')),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 840),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
            ),
            itemCount: iconList.length,
            itemBuilder: (context, index) => Card(
              child: Icon(
                iconList[index],
                color: (index % 4 == 0) ? primaryColor : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
