import 'dart:developer';

import 'package:mobx/mobx.dart';

part 'main_page_state.g.dart';

class MainPageState = MainPageStateBase with _$MainPageState;

abstract class MainPageStateBase with Store {
  @observable
  int pageIndex = 0;
  int maxPages = 3;

  @action
  void setPageIndex(int index){
    pageIndex = index;
  }
}
