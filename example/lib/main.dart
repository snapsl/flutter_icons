import 'dart:math' as math;

import 'package:ant_design_icons/ant_design_icons.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:hero_icons/hero_icons.dart';
import 'package:ionic_icons/ionic_icons.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:radix_icons/radix_icons.dart';
import 'package:remix_icons/remix_icons.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:tabler_icons/tabler_icons.dart';
import 'package:url_launcher/link.dart';

void main() {
  runApp(const ExampleApp());
}

const appTitle = 'Flutter Icons Example';

final random = math.Random();

class ExampleApp extends StatelessWidget {
  static final seedColor =
      Colors.primaries[random.nextInt(Colors.primaries.length)];

  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: buildTheme(.light),
      darkTheme: buildTheme(.dark),
      home: const ExamplePage(),
    );
  }

  static ThemeData buildTheme(Brightness brightness) {
    return ThemeData(
      colorScheme: .fromSeed(
        seedColor: seedColor,
        brightness: brightness,
        dynamicSchemeVariant: .expressive,
      ),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 840),
          child: Card.outlined(
            clipBehavior: .hardEdge,
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
                        builder: (context, followLink) {
                          return IconButton(
                            tooltip: 'Open in GitHub',
                            onPressed: followLink,
                            icon: const Icon(SimpleIcons.github, size: 30),
                          );
                        },
                      ),
                    ],
                    expandedHeight: 120,
                    flexibleSpace: const FlexibleSpaceBar(
                      title: Text(appTitle),
                      centerTitle: true,
                    ),
                  ),
                  ...IconSet.values.map(
                    (iconSet) => SliverIconSet(iconSet: iconSet),
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

enum IconSet {
  antDesign(
    title: 'Ant Design Icons',
    uri: 'https://ant.design/components/icon',
    icon: AntDesignIcons.antDesign_outlined,
    items: AntDesignIcons.values,
  ),
  bootstrap(
    title: 'Bootstrap Icons',
    uri: 'https://icons.getbootstrap.com',
    icon: BootstrapIcons.bootstrap,
    items: BootstrapIcons.values,
  ),
  hero(
    title: 'Hero Icons',
    uri: 'https://heroicons.com',
    icon: SimpleIcons.tailwindcss,
    items: HeroIcons.values,
  ),
  ionic(
    title: 'Ionic Icons',
    uri: 'https://ionic.io/ionicons',
    icon: IonicIcons.logoIonic,
    items: IonicIcons.values,
  ),
  lucide(
    title: 'Lucide Icons',
    uri: 'https://lucide.dev/icons',
    icon: SimpleIcons.lucide,
    items: LucideIcons.values,
  ),
  radix(
    title: 'Radix Icons',
    uri: 'https://radix-ui.com/icons',
    icon: SimpleIcons.radixui,
    items: RadixIcons.values,
  ),
  remix(
    title: 'Remix Icons',
    uri: 'https://remixicon.com',
    icon: RemixIcons.remixiconFill,
    items: RemixIcons.values,
  ),
  simple(
    title: 'Simple Icons',
    uri: 'https://simpleicons.org',
    icon: SimpleIcons.simpleicons,
    items: SimpleIcons.values,
  ),
  tabler(
    title: 'Tabler Icons',
    uri: 'https://tabler.io/icons',
    icon: TablerIcons.brandTabler,
    items: TablerIcons.values,
  );

  final String title;

  final String uri;

  final IconData icon;

  final List<IconData> items;

  const IconSet({
    required this.title,
    required this.uri,
    required this.icon,
    required this.items,
  });
}

class SliverIconSet extends StatelessWidget {
  final IconSet iconSet;

  const SliverIconSet({super.key, required this.iconSet});

  @override
  Widget build(BuildContext context) {
    final icons = createRandomIcons(context);

    return SliverMainAxisGroup(
      slivers: [
        const SliverToBoxAdapter(child: Divider(color: Colors.transparent)),
        PinnedHeaderSliver(
          child: ListTile(
            leading: IconButton(onPressed: null, icon: Icon(iconSet.icon)),
            trailing: Link(
              uri: .parse(iconSet.uri),
              builder: (context, followLink) {
                return ElevatedButton.icon(
                  onPressed: followLink,
                  label: Text(iconSet.title),
                  icon: const Icon(Icons.launch),
                  iconAlignment: .end,
                );
              },
            ),
          ),
        ),
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
          ),
          itemCount: icons.length,
          itemBuilder: (context, index) {
            return Card.filled(child: icons[index]);
          },
        ),
      ],
    );
  }

  List<Widget> createRandomIcons(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final shuffledIcons = [...iconSet.items]..shuffle(random);

    final colors = [
      colorScheme.primary,
      colorScheme.secondary,
      colorScheme.tertiary,
      null,
    ];

    return List.generate(
      colors.length,
      (index) => Icon(
        shuffledIcons.elementAtOrNull(index),
        size: 30,
        color: colors[index],
      ),
      growable: false,
    );
  }
}
