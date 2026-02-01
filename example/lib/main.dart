import 'dart:math' as math;

import 'package:ant_design_icons/ant_design_icons.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:hero_icons/hero_icons.dart';
import 'package:ionic_icons/ionic_icons.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:remix_icons/remix_icons.dart';
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
  static const _iconSets = [
    _SliverIconSet(
      title: 'Ant Design Icons',
      uri: 'https://ant.design/components/icon/',
      iconList: [
        AntDesignIcons.antDesign_outlined,
        AntDesignIcons.file_filled,
        AntDesignIcons.camera_outlined,
        AntDesignIcons.bug_filled,
      ],
    ),
    _SliverIconSet(
      title: 'Bootstrap Icons',
      uri: 'https://icons.getbootstrap.com',
      iconList: [
        BootstrapIcons.bootstrap,
        BootstrapIcons.activity,
        BootstrapIcons.dashCircleFill,
        BootstrapIcons.magic,
      ],
    ),
    _SliverIconSet(
      title: 'Hero Icons',
      uri: 'https://heroicons.com',
      iconList: [
        HeroIcons.shieldCheck_outline,
        HeroIcons.map,
        HeroIcons.heart_outline,
        HeroIcons.adjustmentsHorizontal,
      ],
    ),
    _SliverIconSet(
      title: 'Ionic Icons',
      uri: 'https://ionic.io/ionicons',
      iconList: [
        IonicIcons.logoIonic,
        IonicIcons.home,
        IonicIcons.camera,
        IonicIcons.airplane,
      ],
    ),
    _SliverIconSet(
      title: 'Lucide Icons',
      uri: 'https://lucide.dev/icons/',
      iconList: [
        LucideIcons.album,
        LucideIcons.ban,
        LucideIcons.diamond,
        LucideIcons.squareMenu,
      ],
    ),
    _SliverIconSet(
      title: 'Remix Icons',
      uri: 'https://remixicon.com/',
      iconList: [
        RemixIcons.remixFill,
        RemixIcons.accountPinBoxFill,
        RemixIcons.tentLine,
        RemixIcons.chat3Fill,
      ],
    ),
    _SliverIconSet(
      title: 'Simple Icons',
      uri: 'https://simpleicons.org',
      iconList: [
        SimpleIcons.simpleicons,
        SimpleIcons.cesium,
        SimpleIcons.flutter,
        SimpleIcons.homeassistant,
      ],
    ),
    _SliverIconSet(
      title: 'Tabler Icons',
      uri: 'https://tabler.io/icons',
      iconList: [
        TablerIcons.brandTabler,
        TablerIcons.mail_filled,
        TablerIcons.album,
        TablerIcons.sun_filled,
      ],
    ),
  ];

  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 840),
          child: Card.outlined(
            clipBehavior: Clip.hardEdge,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(
                context,
              ).copyWith(scrollbars: false),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    actions: [
                      Link(
                        uri: .parse('https://github.com/snapsl/flutter_icons'),
                        builder: (context, followLink) => IconButton(
                          tooltip: 'Open in GitHub',
                          onPressed: followLink,
                          icon: const Icon(SimpleIcons.github, size: 28),
                        ),
                      ),
                      TextButton(
                        onPressed: () => showAboutDialog(context: context),
                        child: const Text('About'),
                      ),
                    ],
                    expandedHeight: 120,
                    flexibleSpace: const FlexibleSpaceBar(
                      title: Text(_title),
                      centerTitle: true,
                    ),
                  ),
                  ..._iconSets,
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
        const SliverToBoxAdapter(child: Divider(color: Colors.transparent)),
        PinnedHeaderSliver(
          child: ListTile(
            title: Align(
              alignment: .centerLeft,
              child: Link(
                uri: .parse(uri),
                builder: (context, followLink) => ElevatedButton.icon(
                  onPressed: followLink,
                  label: Text(title),
                  icon: Icon(Icons.launch, size: 16),
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
      ],
    );
  }
}
