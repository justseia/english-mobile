import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/colors.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../routes/route_constants.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late List<String> titleAppBar = [
    AppLocalizations.of(context)!.home,
    AppLocalizations.of(context)!.profile,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void goToBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: .1),
                blurRadius: 10,
              ),
            ],
          ),
          child: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.white,
            scrolledUnderElevation: 0,
            title: Text(
              titleAppBar[widget.navigationShell.currentIndex],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: .25),
              blurRadius: 4,
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.secondaryColor,
          unselectedItemColor: AppColors.secondaryColor,
          backgroundColor: AppColors.white,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: widget.navigationShell.currentIndex,
          selectedLabelStyle: const TextStyle(
            fontSize: 14,
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            color: AppColors.secondaryColor,
            fontWeight: FontWeight.w500,
          ),
          onTap: (value) {
            goToBranch(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: GoRouter.of(context).routerDelegate.currentConfiguration.uri.path == '/${AppRoute.home}' ? AppColors.secondaryColor : AppColors.transparent,
                child: SvgPicture.asset(
                  'assets/icons/home.svg',
                  width: 15,
                  colorFilter: ColorFilter.mode(
                    GoRouter.of(context).routerDelegate.currentConfiguration.uri.path == '/${AppRoute.home}' ? AppColors.white : AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: GoRouter.of(context).routerDelegate.currentConfiguration.uri.path == '/${AppRoute.profile}' ? AppColors.secondaryColor : AppColors.transparent,
                child: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  width: 15,
                  height: 12,
                  colorFilter: ColorFilter.mode(
                    GoRouter.of(context).routerDelegate.currentConfiguration.uri.path == '/${AppRoute.profile}' ? AppColors.white : AppColors.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              label: AppLocalizations.of(context)!.profile,
            ),
          ],
        ),
      ),
    );
  }
}
