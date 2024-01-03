import 'dart:developer';

import 'package:RoJuTube/screens/profile/generate_animation_state.dart';
import 'package:RoJuTube/ui_utils/route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

class GenerateAnimationPage extends StatelessWidget {
  GenerateAnimationPage({super.key});

  final GenerateAnimationState _state = GenerateAnimationState();
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        if (!_state.isExecutable) {
          return Container();
        }

        var theme = Theme.of(context);
        var currentStep = _state.currentStep;
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
                        'Ваш текущий аватар',
                        style: theme.textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary, // border color
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.person,
                              size: 150,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      FilledButton(
                          onPressed: () {}, child: Text('Изменить аватар')),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
              state: currentStep == 0 ? StepState.editing : StepState.complete,
              isActive: currentStep == 0,
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
                    Text(
                      'Генерируем анимации',
                      style: theme.textTheme.titleLarge,
                    ),
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
              state: currentStep == 1
                  ? StepState.editing
                  : currentStep > 1
                  ? StepState.complete
                  : StepState.indexed,
              isActive: currentStep == 1,
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
                    Text(
                      'Проверьте резальтат',
                      style: theme.textTheme.titleLarge,
                    ),
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
                              _state.setCarouselStep(index)),
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
                                      .withOpacity(
                                      _state.carouselActiveIndex == entry.key
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
              state: currentStep == 2
                  ? StepState.editing
                  : currentStep > 2
                  ? StepState.complete
                  : StepState.indexed,
              isActive: currentStep == 2,
            )
          ],
          onStepTapped: (int newIndex) {
            _state.setNewStep(newIndex);
          },
          currentStep: currentStep,
          onStepContinue: () {
            if (_state.canStepNext()) {
              _state.setNewStep(currentStep + 1);
            } else {
              context.go(AppRoute.ProfileRoute);
            }
          },
          onStepCancel: () {
            if (_state.canStepPrev()) {
              _state.setNewStep(currentStep - 1);
            } else {
              context.go(AppRoute.ProfileRoute);
            }
          },
        );
      },
    );
  }
}
