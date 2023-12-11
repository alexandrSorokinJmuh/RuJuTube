import 'package:RoJuTube/ui_utils/route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GenerateAvatarStepper extends StatefulWidget {
  const GenerateAvatarStepper({super.key});

  @override
  State<GenerateAvatarStepper> createState() => _GenerateAvatarStepperState();
}

class _GenerateAvatarStepperState extends State<GenerateAvatarStepper> {
  int _currentStep = 0;
  int _carouselActiveIndex = 0;
  int _maxSteps = 3;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Stepper(
      type: StepperType.horizontal,
      steps: [
        Step(
          title: const Text(''),
          content: Container(
            child: Card(
              clipBehavior: Clip.hardEdge,
              elevation: 1,
              shadowColor: theme.colorScheme.primary,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Загрузите ваше фото',
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary, // border color
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Icon(
                          Icons.add_a_photo_outlined,
                          size: 150,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          state: _currentStep == 0 ? StepState.editing : StepState.complete,
          isActive: _currentStep == 0,
        ),
        Step(
          title: const Text(''),
          content: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 1,
            shadowColor: theme.colorScheme.primary,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text('Генерируем аватары', style: theme.textTheme.titleLarge,),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: CircularProgressIndicator(),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          state: _currentStep == 1
              ? StepState.editing
              : _currentStep > 1
                  ? StepState.complete
                  : StepState.indexed,
          isActive: _currentStep == 1,
        ),
        Step(
          title: const Text(''),
          content: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 1,
            shadowColor: theme.colorScheme.primary,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text('Выберете самое лучшее!', style: theme.textTheme.titleLarge,),
                CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      // autoPlay: true,
                      // autoPlayInterval: Duration(seconds: 3),
                      // autoPlayAnimationDuration: Duration(milliseconds: 800),
                      // autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) =>
                          setState(() => _carouselActiveIndex = index)),
                  items: [1, 2, 3, 4, 5].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Icon(
                              Icons.image,
                              size: 250,
                            ));
                      },
                    );
                  }).toList(),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [1, 2, 3, 4, 5].asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            _carouselController.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(_carouselActiveIndex == entry.key
                                      ? 0.9
                                      : 0.4)),
                        ),
                      );
                    }).toList()),
                FilledButton(
                    onPressed: () {}, child: Text('Сгенерировать заново')),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
          state: _currentStep == 2
              ? StepState.editing
              : _currentStep > 2
                  ? StepState.complete
                  : StepState.indexed,
          isActive: _currentStep == 2,
        )
      ],
      onStepTapped: (int newIndex) {
        setState(() {
          _currentStep = newIndex;
        });
      },
      currentStep: _currentStep,
      onStepContinue: () {
        if (_currentStep + 1 < _maxSteps) {
          setState(() {
            _currentStep++;
          });
        } else {
          context.go(AppRoute.ProfileRoute);
        }
      },
      onStepCancel: () {
        if (_currentStep > 0) {
          setState(() {
            _currentStep--;
          });
        } else {
          context.go(AppRoute.ProfileRoute);
        }
      },
    );
  }
}
