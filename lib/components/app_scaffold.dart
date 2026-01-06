import 'package:flutter/material.dart';
import 'package:portfolio_website/components/background_blur.dart';
import 'package:portfolio_website/components/my_app_bar.dart';
import 'package:portfolio_website/components/my_footer.dart';
import 'package:portfolio_website/util/constants/app_size.dart';
import 'package:portfolio_website/util/constants/extension.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.slivers});
  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          BackgroundBlur(),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: EdgeInsets.only(top: context.inserts.appBarHeight),
              constraints: const BoxConstraints(maxWidth: Inserts.maxWidth),
              child: CustomScrollView(
                slivers: [...slivers, SliverToBoxAdapter(child: MyFooter())],
              ),
            ),
          ),
          MyAppBar(),
        ],
      ),
    );
  }
}
