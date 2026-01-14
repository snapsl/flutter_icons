import 'dart:math' as math;

import 'package:ant_design_icons/ant_design_icons.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:url_launcher/link.dart';

void main() {
  runApp(const ExampleApp());
}

const _title = 'Flutter Icons Example';

class ExampleApp extends StatelessWidget {
  static final Color _seedColor =
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
            constraints: const BoxConstraints(maxWidth: 840),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(
                context,
              ).copyWith(scrollbars: false),
              child: Card.outlined(
                clipBehavior: .hardEdge,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      actions: [
                        Link(
                          uri: .parse(
                            'https://github.com/snapsl/flutter_icons',
                          ),
                          builder: (context, followLink) => IconButton(
                            onPressed: followLink,
                            icon: const Icon(SimpleIcons.github),
                          ),
                        ),
                      ],
                      expandedHeight: 120,
                      flexibleSpace: const FlexibleSpaceBar(
                        title: Text(_title),
                        centerTitle: true,
                      ),
                    ),
                    const _SliverIconSet(
                      title: 'Ant Design Icons',
                      uri: 'https://ant.design/components/icon/',
                      iconList: [
                        AntDesignIcons.antDesign_outlined,
                        AntDesignIcons.file_filled,
                        AntDesignIcons.camera_outlined,
                        AntDesignIcons.bug_filled,
                      ],
                    ),
                    const _SliverIconSet(
                      title: 'Bootstrap Icons',
                      uri: 'https://icons.getbootstrap.com',
                      iconList: [
                        BootstrapIcons.bootstrap,
                        BootstrapIcons.activity,
                        BootstrapIcons.dashCircleFill,
                        BootstrapIcons.magic,
                      ],
                    ),
                    const _SliverIconSet(
                      title: 'Lucide Icons',
                      uri: 'https://lucide.dev/icons/',
                      iconList: [
                        LucideIcons.album,
                        LucideIcons.ban,
                        LucideIcons.diamond,
                        LucideIcons.squareMenu,
                      ],
                    ),
                    const _SliverIconSet(
                      title: 'Simple Icons',
                      uri: 'https://simpleicons.org',
                      iconList: [
                        SimpleIcons.simpleicons,
                        SimpleIcons.cesium,
                        SimpleIcons.flutter,
                        SimpleIcons.homeassistant,
                      ],
                    ),
                    const _SliverIconSet(
                      title: 'Tabler Icons',
                      uri: 'https://tabler.io/icons',
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
      ),
    );
  }
}

class _SliverIconSet extends StatelessWidget {
  final String title;

  final String uri;

  final List<IconData> iconList;

  const _SliverIconSet({
    required this.title,
    required this.uri,
    required this.iconList,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SliverMainAxisGroup(
      slivers: [
        SliverFloatingHeader(
          child: ListTile(
            title: Align(
              alignment: .centerLeft,
              child: Link(
                uri: .parse(uri),
                builder: (context, followLink) => ElevatedButton.icon(
                  onPressed: followLink,
                  label: Text(title),
                  icon: Icon(Icons.adaptive.arrow_forward),
                  iconAlignment: .end,
                ),
              ),
            ),
          ),
        ),
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
          ),
          itemCount: iconList.length,
          itemBuilder: (context, index) => Card.filled(
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
        const SliverToBoxAdapter(child: Divider(color: Colors.transparent)),
      ],
    );
  }
}
