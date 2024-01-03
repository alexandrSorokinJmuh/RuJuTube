import 'dart:developer';

import 'package:mobx/mobx.dart';

part 'generate_avatar_state.g.dart';

class GenerateAvatarState = GenerateAvatarStateBase with _$GenerateAvatarState;

abstract class GenerateAvatarStateBase with Store {
  @observable
  int currentStep = 0;
  @observable
  int carouselActiveIndex = 0;
  int maxSteps = 3;

  @action
  void setNewStep(int stepIndex) {
    currentStep = stepIndex;
  }

  @computed
  bool get isExecutable => currentStep < maxSteps && currentStep >= 0;

  @action
  bool canStepNext() {
    return currentStep + 1 < maxSteps;
  }

  @action
  bool canStepPrev() {
    return currentStep > 0;
  }

  @action
  void setCarouselStep(int carouselIndex) {
    carouselActiveIndex = carouselIndex;
  }
}
