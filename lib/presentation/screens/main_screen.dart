import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_portal_app/core/constants/app_colors.dart';
import 'package:job_portal_app/core/constants/app_icons.dart';
import 'package:job_portal_app/core/constants/app_size_config.dart';
import 'package:job_portal_app/core/helper/helper.dart';
import 'package:job_portal_app/presentation/widgets/icon_widget.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/';
  static _MainScreenState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MainScreenState>();
  const MainScreen({super.key, this.initialPage = 0});
  final int initialPage;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.initialPage);
    super.initState();
  }

  void jumpToPage(index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
    // context.read<SettingCubit>().onPageChanged(index);
  }

  @override
  void didUpdateWidget(covariant MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialPage != oldWidget.initialPage) {
      _pageController.jumpToPage(widget.initialPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppSizeConfig().init(context);

    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          // HomeScreen(),
          // CategoryScreen(),
          // CartScreen(),
          // ProfileScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: appWhite,
        onDestinationSelected: jumpToPage,
        indicatorColor: primary,
        surfaceTintColor: appWhite,
        selectedIndex: 0,
        destinations: [
          NavigationDestination(
            selectedIcon: IconWidget(
              assetName: homeSvg,
              width: 24.scale,
              height: 24.scale,
              colorFilter: ColorFilter.mode(appWhite, BlendMode.srcIn),
            ),
            icon: IconWidget(
              assetName: homeSvg,
              width: 24.scale,
              height: 24.scale,
            ),
            label: 'home'.tr,
          ),
          NavigationDestination(
            selectedIcon: IconWidget(
              assetName: menuSvg,
              width: 24.scale,
              height: 24.scale,
              colorFilter: ColorFilter.mode(appWhite, BlendMode.srcIn),
            ),
            icon: IconWidget(
              assetName: menuSvg,
              width: 24.scale,
              height: 24.scale,
            ),
            label: 'categories'.tr,
          ),
          // NavigationDestination(
          //   selectedIcon: Badge.count(
          //     isLabelVisible: count > 0,
          //     count: count,
          //     child: IconWidget(
          //       assetName: cartSvg,
          //       width: 24.scale,
          //       height: 24.scale,
          //       colorFilter: ColorFilter.mode(appWhite, BlendMode.srcIn),
          //     ),
          //   ),
          //   icon: Badge.count(
          //     isLabelVisible: count > 0,
          //     count: count,
          //     child: IconWidget(
          //       assetName: cartSvg,
          //       width: 24.scale,
          //       height: 24.scale,
          //     ),
          //   ),
          //   label: 'carts'.tr,
          // ),
          // NavigationDestination(
          //   selectedIcon: IconWidget(
          //     assetName: userSvg,
          //     width: 24.scale,
          //     height: 24.scale,
          //     colorFilter: ColorFilter.mode(appWhite, BlendMode.srcIn),
          //   ),
          //   icon: IconWidget(
          //     assetName: userSvg,
          //     width: 24.scale,
          //     height: 24.scale,
          //   ),
          //   label: 'account'.tr,
          // ),
        ],
      ),
    );
  }
}
