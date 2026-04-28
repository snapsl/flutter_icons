[![Test packages][test-packages-badge]][test-packages-link]
[![Website][website-badge]][website-link]
[![codecov][codecov-badge]][codecov-link]
[![GitHub License][license-badge]][license-link]
[![style: very good analysis][style-badge]][style-link]

# Flutter Icons

A collection of icon sets for your Flutter apps.

> [!IMPORTANT]
> Compatible with the [breaking change][breaking-change]: `IconData` class marked as `final`.

## Overview

This project contains a collection of icon sets for Flutter. The icons are generated from popular open-source icon libraries.

| Icon Set | pub.dev | GitHub Release |
| --- | --- | --- |
| [Ant Design Icons][ant-design-site] | [![pub package][pub-badge]][ant-design-pub] | [![GitHub Release][ant-design-release]][releases-link] |
| [Bootstrap Icons][bootstrap-site] | [![pub package][pub-badge]][bootstrap-pub] | [![GitHub Release][bootstrap-release]][releases-link] |
| [Hero Icons][hero-site] | [![pub package][pub-badge]][hero-pub] | [![GitHub Release][hero-release]][releases-link] |
| [Ionic Icons][ionic-site] | [![pub package][pub-badge]][ionic-pub] | [![GitHub Release][ionic-release]][releases-link] |
| [Lucide Icons][lucide-site] | [![pub package][pub-badge]][lucide-pub] | [![GitHub Release][lucide-release]][releases-link] |
| [Radix Icons][radix-site] | [![pub package][pub-badge]][radix-pub] | [![GitHub Release][radix-release]][releases-link] |
| [Remix Icons][remix-site] | [![pub package][pub-badge]][remix-pub] | [![GitHub Release][remix-release]][releases-link] |
| [Simple Icons][simple-site] | [![pub package][pub-badge]][simple-pub] | [![GitHub Release][simple-release]][releases-link] |
| [Tabler Icons][tabler-site] | [![pub package][pub-badge]][tabler-pub] | [![GitHub Release][tabler-release]][releases-link] |

## Demo

Checkout the demo on [GitHub Pages][demo-link].

## Installation

To use an icon set for a Flutter application, add a package as a Git dependency in the `pubspec.yaml` file.
For example, the `bootstrap_icons` package can be installed by adding the following entry:

```yaml
dependencies:
  bootstrap_icons:
    git:
      url: https://github.com/snapsl/flutter_icons.git
      path: packages/bootstrap_icons
      tag_pattern: "bootstrap_icons-v{{version}}"
    version: latest
```

## Other Icon Sets

Here are some popular existing icon sets available for Flutter:

| Icon Set | Version |
| --- | --- |
| Phosphor Icons | [![pub package][phosphor-pub-badge]][phosphor-pub-link] |
| Hugeicons | [![pub package][hugeicons-pub-badge]][hugeicons-pub-link] |
| Fluent UI System Icons | [![pub package][fluentui-pub-badge]][fluentui-pub-link] |
| Font Awesome Flutter | [![pub package][font-awesome-pub-badge]][font-awesome-pub-link] |

## License

This project is licensed under the MIT License. See the [LICENSE][license-link] file for details.

## Third-Party Notice

**The project does not claim ownership of the individual icon sets included in this repository**.
All trademarks, logos, and assets of the icon sets are the property of their respective owners.

Individual icon sets may be subject to their own specific licenses.

Please refer to the respective `LICENSE` files within each package directory for detailed terms and attribution requirements.

<!-- References -->
[test-packages-badge]: https://img.shields.io/github/actions/workflow/status/snapsl/flutter_icons/test-packages.yml?label=test%20packages
[test-packages-link]: https://github.com/snapsl/flutter_icons/actions/workflows/test-packages.yml
[website-badge]: https://img.shields.io/github/actions/workflow/status/snapsl/flutter_icons/github-page.yml?label=website
[website-link]: https://github.com/snapsl/flutter_icons/actions/workflows/github-page.yml
[codecov-badge]: https://codecov.io/gh/snapsl/flutter_icons/graph/badge.svg
[codecov-link]: https://codecov.io/gh/snapsl/flutter_icons
[license-badge]: https://img.shields.io/github/license/snapsl/flutter_icons
[license-link]: LICENSE
[style-badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[style-link]: https://pub.dev/packages/very_good_analysis
[ant-design-site]: https://ant.design/components/icon
[bootstrap-site]: https://icons.getbootstrap.com
[hero-site]: https://heroicons.com
[ionic-site]: https://ionic.io/ionicons
[lucide-site]: https://lucide.dev/icons
[radix-site]: https://www.radix-ui.com/icons
[remix-site]: https://remixicon.com
[simple-site]: https://simpleicons.org
[tabler-site]: https://tabler.io/icons
[pub-badge]: https://img.shields.io/badge/version-placeholder-silver
[ant-design-pub]: https://pub.dev/packages/flutter_icons/ant_design_icons
[bootstrap-pub]: https://pub.dev/packages/flutter_icons/bootstrap_icons
[hero-pub]: https://pub.dev/packages/flutter_icons/heroicons
[ionic-pub]: https://pub.dev/packages/flutter_icons/ionic_icons
[lucide-pub]: https://pub.dev/packages/flutter_icons/lucide_icons
[radix-pub]: https://pub.dev/packages/flutter_icons/radix_icons
[remix-pub]: https://pub.dev/packages/flutter_icons/remix_icons
[simple-pub]: https://pub.dev/packages/flutter_icons/simple_icons
[tabler-pub]: https://pub.dev/packages/flutter_icons/tabler_icons
[ant-design-release]: https://img.shields.io/github/v/release/snapsl/flutter_icons?filter=ant_design*
[bootstrap-release]: https://img.shields.io/github/v/release/snapsl/flutter_icons?filter=bootstrap*
[hero-release]: https://img.shields.io/github/v/release/snapsl/flutter_icons?filter=hero*
[ionic-release]: https://img.shields.io/github/v/release/snapsl/flutter_icons?filter=ionic*
[lucide-release]: https://img.shields.io/github/v/release/snapsl/flutter_icons?filter=lucide*
[radix-release]: https://img.shields.io/github/v/release/snapsl/flutter_icons?filter=radix*
[remix-release]: https://img.shields.io/github/v/release/snapsl/flutter_icons?filter=remix*
[simple-release]: https://img.shields.io/github/v/release/snapsl/flutter_icons?filter=simple*
[tabler-release]: https://img.shields.io/github/v/release/snapsl/flutter_icons?filter=tabler*
[releases-link]: https://github.com/snapsl/flutter_icons/releases
[demo-link]: https://snapsl.github.io/flutter_icons/
[phosphor-pub-badge]: https://img.shields.io/pub/v/phosphor_flutter.svg
[phosphor-pub-link]: https://pub.dev/packages/phosphor_flutter
[hugeicons-pub-badge]: https://img.shields.io/pub/v/hugeicons.svg
[hugeicons-pub-link]: https://pub.dev/packages/hugeicons
[fluentui-pub-badge]: https://img.shields.io/pub/v/fluentui_system_icons.svg
[fluentui-pub-link]: https://pub.dev/packages/fluentui_system_icons
[font-awesome-pub-badge]: https://img.shields.io/pub/v/font_awesome_flutter.svg
[font-awesome-pub-link]: https://pub.dev/packages/font_awesome_flutter
[breaking-change]: https://docs.flutter.dev/release/breaking-changes/icondata-class-marked-final
