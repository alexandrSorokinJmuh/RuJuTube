import 'package:RoJuTube/screens/create-content/content.dart';
import 'package:RoJuTube/screens/home/home.dart';
import 'package:RoJuTube/screens/profile/profile.dart';
import 'package:RoJuTube/ui_utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../config/di_config.dart';
import '../generated/l10n.dart';
import '../ui_utils/route.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var appThemeData = getIt.get<AppThemeData>();
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: appThemeData.getLightTheme(),
      darkTheme: appThemeData.getDarkTheme(),
      routerConfig: AppRoute.routes,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

class GeneralWrapperPage extends StatefulWidget {
  int index;

  GeneralWrapperPage({this.index = 0, super.key});

  @override
  State<GeneralWrapperPage> createState() => _GeneralWrapperPageState(index);
}

class _GeneralWrapperPageState extends State<GeneralWrapperPage> {
  int _selectedValue = 0;

  final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _listOfWidget = <Widget>[
    const HomePage(),
    const ContentPage(),
    const ProfilePage()
  ];

  _GeneralWrapperPageState(int inputIndex) {
    _selectedValue = inputIndex;
  }

  void onButtonPressed(int index) {
    setState(() {
      _selectedValue = index;
      // _pageController.
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = S.of(context);

    return Scaffold(
      appBar: AppBar(toolbarHeight: 5,),
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
            child: GNav(
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
              selectedIndex: _selectedValue,
              onTabChange: onButtonPressed,
            ),
          ),
        // ),
      ),
    );
  }
}
