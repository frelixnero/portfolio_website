import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/components/drawer_menu.dart';

class MyAppBarDrawerIcon extends ConsumerStatefulWidget {
  const MyAppBarDrawerIcon({super.key});

  @override
  ConsumerState<MyAppBarDrawerIcon> createState() => _MyAppBarDrawerIconState();
}

class _MyAppBarDrawerIconState extends ConsumerState<MyAppBarDrawerIcon>
    with SingleTickerProviderStateMixin {
  // animated controller
  late AnimationController _animationController;
  late Animation<double> animation;

  // isOpen
  bool isOpen = false;

  // Initialize state
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          if (!isOpen) {
            _animationController.forward();
            ref.read(drawerMenuControllerProvider.notifier).open();
          } else {
            _animationController.reverse();
            ref.read(drawerMenuControllerProvider.notifier).close();
          }
          isOpen = !isOpen;
          
        });
      },
      icon: AnimatedIcon(icon: AnimatedIcons.menu_close, progress: animation),
    );
  }
}
