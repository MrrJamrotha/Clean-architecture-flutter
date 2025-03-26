import 'package:flutter/material.dart'; 
import 'package:job_portal_app/presentation/screens/main_screen.dart';
class AppNavigator {
  static SlideTransition _st(animation, child) {
    final tween = Tween(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    );
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.ease,
    );
    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }

  static Route<dynamic>? appRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => MainScreen(),
        );
      // case ItemDetailScreen.routeName:
      //   return PageRouteBuilder(
      //     pageBuilder: (context, animation, secondaryAnimation) {
      //       final parameters = settings.arguments as Map<String, dynamic>;
      //       return ItemDetailScreen(
      //         key: ValueKey(ItemDetailScreen.routeName),
      //         parameters: parameters,
      //       );
      //     },
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //       return _st(animation, child);
      //     },
      //   );
 

      default:
        return MaterialPageRoute(builder: (_) => const MainScreen());
    }
  }
}
