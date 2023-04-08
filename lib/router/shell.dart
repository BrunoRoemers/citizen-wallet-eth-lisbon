import 'package:citizenwallet/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class RouterShell extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  RouterShell({
    Key? key,
    required this.child,
    required this.state,
  }) : super(key: key);

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.money_euro_circle),
        activeIcon: Icon(
          CupertinoIcons.money_euro_circle_fill,
        )),
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings)),
  ];

  final routes = {
    '/wallet': 0,
    '/settings': 1,
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      key: Key(state.location),
      backgroundColor: ThemeColors.uiBackground.resolveFrom(context),
      child: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: child,
          ),
          CupertinoTabBar(
            items: items,
            currentIndex: routes[state.location] ?? 0,
            backgroundColor: ThemeColors.uiBackground.resolveFrom(context),
            onTap: (index) {
              switch (index) {
                case 0:
                  GoRouter.of(context).go('/wallet');
                  break;
                case 1:
                  GoRouter.of(context).go('/settings');
                  break;
                default:
                // GoRouter.of(context).go('/404');
              }
            },
          ),
        ],
      )),
    );
  }
}