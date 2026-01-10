import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_website/components/drawer_menu.dart';
import 'package:portfolio_website/components/language_toggle.dart';
import 'package:portfolio_website/components/my_app_bar_drawer_icon.dart';
import 'package:portfolio_website/shared_pref/app_theme_controller.dart';
import 'package:portfolio_website/util/constants/app_menu_list.dart';
import 'package:portfolio_website/util/constants/app_size.dart';
import 'package:portfolio_website/util/theme/app_text_style.dart';
import 'package:portfolio_website/util/constants/extension.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          height: context.inserts.appBarHeight,
          padding: EdgeInsets.symmetric(horizontal: context.inserts.padding),
          decoration: BoxDecoration(
            color: context.theme.appBarTheme.backgroundColor,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: Inserts.maxWidth),
            child: Row(
              children: [
                AppLogo(),
                Spacer(),
                if (context.isDesktop) LargeAppMenu(),
                Spacer(),
                LanguageToggle(),
                ThemeToggle(),
                if (!context.isDesktop) MyAppBarDrawerIcon(),
              ],
            ),
          ),
        ),
        if (!context.isDesktop) DrawerMenu(),
      ],
    );
  }

  List<Widget> _appBar(BuildContext context) {
    List<Widget> mywidgetList = [
      AppLogo(),
      Spacer(),
      LargeAppMenu(),
      Spacer(),
      LanguageToggle(),
      ThemeToggle(),
    ];
    List<Widget> smallwidgetList = [
      AppLogo(),
      Spacer(),
      LargeAppMenu(),
      Spacer(),
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [LanguageToggle(), ThemeToggle()],
      ),
    ];
    if (MediaQuery.of(context).size.width <= 504) {
      return smallwidgetList;
    } else {
      return mywidgetList;
    }
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Portfolio',
      style:
          MediaQuery.of(context).size.width > 600
              ? LargeTextStyle().titleLgBold
              : SmallTextStyle().titleLgBold,
    );
  }
}

class LargeAppMenu extends StatelessWidget {
  const LargeAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:
          AppMenuList.getItems(context)
              .map(
                (AppMenu e) => LargeMenuItem(
                  title: e.title,
                  isSelected: GoRouterState.of(context).fullPath == e.path,
                  onTapped: () {
                    GoRouter.of(context).go(e.path);
                  },
                ),
              )
              .toList(),
    );
  }
}

class SmallMenu extends StatelessWidget {
  const SmallMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          AppMenuList.getItems(context)
              .map(
                (AppMenu e) => LargeMenuItem(
                  title: e.title,
                  isSelected: GoRouterState.of(context).fullPath == e.path,
                  onTapped: () {
                    GoRouter.of(context).go(e.path);
                  },
                ),
              )
              .toList(),
    );
  }
}

class LargeMenuItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTapped;

  const LargeMenuItem({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Inserts.med,
          vertical: Inserts.xs,
        ),
        child: Text(
          title,
          style: SmallTextStyle().bodyLgMedium.copyWith(
            color:
                isSelected
                    ? context.theme.colorScheme.onBackground
                    : context.theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(appThemeControllerProvider);
    return Switch(
      value: state.value == ThemeMode.dark,
      onChanged: (bool value) {
        // ref
        //     .read(appThemeControllerProvider.notifier)
        //     .changeTheme(value ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }
}
