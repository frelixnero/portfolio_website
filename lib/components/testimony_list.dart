import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:portfolio_website/components/testimony_item.dart';
import 'package:portfolio_website/util/constants/extension.dart';

class TestimonyList extends StatelessWidget {
  const TestimonyList({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isDesktop || context.isTablet
        ? DesktopTestimonyList()
        : MobileTestimonyList();
  }
}

class DesktopTestimonyList extends StatelessWidget {
  const DesktopTestimonyList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid(
      delegate: SliverChildBuilderDelegate((context, builder) {
        return TestimonyItem();
      }, childCount: 5),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            context.isDesktop
                ? 3
                : context.isTablet
                ? 2
                : 2,
      ),
    );
  }
}

class MobileTestimonyList extends StatelessWidget {
  const MobileTestimonyList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 4,
      itemBuilder: ((context, index) {
        return TestimonyItem();
      }),
      separatorBuilder: (context, index) => Gap(16),
    );
  }
}
