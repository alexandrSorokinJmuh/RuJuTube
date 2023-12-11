import 'package:RoJuTube/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

final StandardCardAppearAnimation = <Effect>[
  FadeEffect(duration: 1000.ms, curve: Curves.easeOutBack),
  MoveEffect(duration: 500.ms,
      begin: Offset(-190, 0),
      end: Offset(0, 0),
      curve: Curves.easeInOutBack),
  FlipEffect(duration: 700.ms, curve: Curves.easeInOutBack),
];

final StandardPageAppearAnimation = <Effect>[
  FadeEffect(duration: 1200.ms, curve: Curves.easeOutBack),
  // MoveEffect(duration: 500.ms,
  //     begin: Offset(-190, 0),
  //     end: Offset(0, 0),
  //     curve: Curves.easeInOutBack),
  // FlipEffect(duration: 700.ms, curve: Curves.easeInOutBack),
];

Widget getGeneralAppWrapper(BuildContext context, Widget child,
    Widget? bottomNavigationBar) {
  var locale = S.of(context);
  return Scaffold(
      appBar: AppBar(toolbarHeight: 5,),
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
          [
            SliverAppBar(
              floating: true,
              snap: true,
              title: Text(
                locale.title,
              ),
            )
          ],
          body: child,
      ),
      bottomNavigationBar: bottomNavigationBar
  );
}