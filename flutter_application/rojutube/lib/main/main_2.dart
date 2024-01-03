import 'package:RoJuTube/main/main_page_state.dart';
import 'package:RoJuTube/screens/create-content/content.dart';
import 'package:RoJuTube/screens/home/home.dart';
import 'package:RoJuTube/screens/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../generated/l10n.dart';

class MainPage extends StatelessWidget {
  MainPage(int index, {super.key}) {
    _state = MainPageState();
    _state.setPageIndex(index);
    _pageController = PageController(initialPage: index);
  }

  late final PageController _pageController;

  late final MainPageState _state;

  final List<Widget> _listOfWidget = <Widget>[
    const HomePage(),
    const ContentPage(),
    const ProfilePage()
  ];

  void onButtonPressed(int index) {
    _state.setPageIndex(index);
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = S.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 5,
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            title: Text(
              locale.title,
            ),
          )
        ],
        body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            children: _listOfWidget,
        ),
      ),
      bottomNavigationBar:
          // DecoratedBox(
          //   decoration: BoxDecoration(
          //     boxShadow: [
          //       BoxShadow(
          //         blurRadius: 20,
          //         color: Colors.black.withOpacity(.1),
          //       )
          //     ],
          //   ),
          //   child:
          SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: Observer(
            builder: (context) => GNav(
              // rippleColor: Colors.grey[300]!,
              // hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: theme.primaryColor,
              // backgroundColor: theme.colorScheme.background,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: theme.primaryColorDark,
              color: theme.colorScheme.primary,
              tabs: [
                GButton(
                  icon: Icons.home,
                  iconActiveColor: theme.colorScheme.secondary,
                  text: locale.home_tab_title,
                ),
                GButton(
                  icon: Icons.add_box,
                  iconActiveColor: theme.colorScheme.secondary,
                  text: locale.content_tab_title,
                ),
                GButton(
                  icon: Icons.person,
                  iconActiveColor: theme.colorScheme.secondary,
                  text: locale.profile_tab_title,
                ),
              ],
              selectedIndex: _state.pageIndex,
              onTabChange: onButtonPressed,
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
