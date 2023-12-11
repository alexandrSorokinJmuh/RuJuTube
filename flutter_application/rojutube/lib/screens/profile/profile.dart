import 'package:RoJuTube/generated/l10n.dart';
import 'package:RoJuTube/ui_utils/route.dart';
import 'package:RoJuTube/ui_utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var locale = S.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  locale.profile_tab_title,
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                // ignore: prefer_const_constructors
                Spacer(),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary, // border color
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                    ),
                  )
                      // .animate().fade(duration: 500.ms, curve: Curves.easeInBack),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.push(AppRoute.GenerateAvatarRoute);
                          },
                          icon: const Icon(Icons.person_add_alt),
                        ),
                        IconButton(
                          onPressed: () {
                            context.push(AppRoute.GenerateAnimationsRoute);
                          },
                          icon: const Icon(Icons.edit_note),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              clipBehavior: Clip.hardEdge,
              elevation: 1,
              shadowColor: theme.colorScheme.primary,
              child: Column(
                children: [
                  ColoredBox(
                    color: theme.colorScheme.primary.withAlpha(50),
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          locale.personal_info,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  ProfileTextInfoRow("Name", "Jmuh"),
                  ProfileTextInfoRow("Email", "test@test.test"),
                ],
              ),
            )
                // .animate(effects: StandardCardAppearAnimation)
          ],
        ),
      ),
    ).animate(effects: StandardPageAppearAnimation);
  }
}

class ProfileTextInfoRow extends StatelessWidget {
  String title;
  String value;

  ProfileTextInfoRow(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [Text("$title:"), Spacer(), Text(value)],
        ),
      ),
    );
  }
}
