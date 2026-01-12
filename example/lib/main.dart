import 'dart:math' as math;

import 'package:ant_design_icons/ant_design_icons.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:tabler_icons/tabler_icons.dart';

void main() {
  runApp(const ExampleApp());
}

const _title = 'Flutter Icons Example';

class ExampleApp extends StatelessWidget {
  static final _seedColor =
      Colors.primaries[math.Random().nextInt(Colors.primaries.length)];

  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      colorScheme: .fromSeed(
        seedColor: _seedColor,
        brightness: .light,
        dynamicSchemeVariant: .expressive,
      ),
    );

    final darkTheme = ThemeData(
      colorScheme: .fromSeed(
        seedColor: _seedColor,
        brightness: .dark,
        dynamicSchemeVariant: .expressive,
      ),
    );

    return MaterialApp(
      title: _title,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: .system,
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 840),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(
                context,
              ).copyWith(scrollbars: false),
              child: const CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text((_title)),
                    centerTitle: true,
                    forceMaterialTransparency: true,
                  ),
                  _SliverIconSet(
                    title: 'Ant Design Icons',
                    iconList: [
                      AntDesignIcons.antDesign_outlined,
                      AntDesignIcons.file_filled,
                      AntDesignIcons.camera_outlined,
                      AntDesignIcons.bug_filled,
                    ],
                  ),
                  _SliverIconSet(
                    title: 'Bootstrap Icons',
                    iconList: [
                      BootstrapIcons.bootstrap,
                      BootstrapIcons.activity,
                      BootstrapIcons.dashCircleFill,
                      BootstrapIcons.magic,
                    ],
                  ),
                  _SliverIconSet(
                    title: 'Lucide Icons',
                    iconList: [
                      LucideIcons.album,
                      LucideIcons.ban,
                      LucideIcons.diamond,
                      LucideIcons.squareMenu,
                    ],
                  ),

                  _SliverIconSet(
                    title: 'Simple Icons',
                    iconList: [
                      SimpleIcons.simpleicons,
                      SimpleIcons.cesium,
                      SimpleIcons.flutter,
                      SimpleIcons.homeassistant,
                    ],
                  ),
                  _SliverIconSet(
                    title: 'Tabler Icons',
                    iconList: [
                      TablerIcons.brandTabler,
                      TablerIcons.mail_filled,
                      TablerIcons.album,
                      TablerIcons.sun_filled,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverIconSet extends StatelessWidget {
  final String title;

  final List<IconData> iconList;

  const _SliverIconSet({required this.title, required this.iconList});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SliverMainAxisGroup(
      slivers: [
        SliverFloatingHeader(child: ListTile(title: Text(title))),
        SliverGrid.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
          ),
          itemCount: iconList.length,
          itemBuilder: (context, index) => Card(
            child: Icon(
              iconList[index],
              color: switch (index % 4) {
                0 => colorScheme.primary,
                1 => colorScheme.secondary,
                2 => colorScheme.tertiary,
                _ => null,
              },
            ),
          ),
        ),
        SliverToBoxAdapter(child: Divider(color: Colors.transparent)),
      ],
    );
  }
}
