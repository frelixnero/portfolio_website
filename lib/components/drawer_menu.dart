import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/components/my_app_bar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part '../models/drawer_menu.g.dart';

class DrawerMenu extends ConsumerStatefulWidget {
  const DrawerMenu({super.key});

  @override
  ConsumerState<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu> with SingleTickerProviderStateMixin{
  
  // animated controller
  late final _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 200));

  // animation
  late final _animation = Tween<Offset>(
    begin: Offset(0, -1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeIn),);

  // dispose
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(drawerMenuControllerProvider, (previous, next){
      if(next.value == true){
        _animationController.forward();

      }else{
        _animationController.reverse();
      }
    },);
    return ClipRRect(
      child: SlideTransition(
        position: _animation,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.surface.withOpacity(0.4),
                blurRadius: 6,
                spreadRadius: 3
              )
            ]
          ),
          child: SmallMenu(),
        ),
      ),
    );
  }
}

@riverpod
class DrawerMenuController extends _$DrawerMenuController{
  @override
  FutureOr<bool> build (){
    return false;
  }

  open(){
    update((state) => true);
  }
  close(){
    update((state) => false);
  }
}