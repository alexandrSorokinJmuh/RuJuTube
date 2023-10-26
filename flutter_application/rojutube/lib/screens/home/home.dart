import 'package:RoJuTube/ui_utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Card(
            elevation: 1,
            shadowColor: theme.colorScheme.primary,
            child: const SizedBox(
              width: double.infinity,
              height: 150,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Home"),
                ),
              ),
            )
          )
              // .animate(effects: StandardCardAppearAnimation)
        ],
      ),
    ).animate(effects: StandardPageAppearAnimation);
  }
}
