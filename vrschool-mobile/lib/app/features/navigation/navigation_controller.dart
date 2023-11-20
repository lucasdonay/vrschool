import 'package:mobx/mobx.dart';
part 'navigation_controller.g.dart';

class NavigationController = NavigationControllerBase with _$NavigationController;

abstract class NavigationControllerBase with Store {

  @observable
  bool bottomNavigationIsVisible = false;

  @observable
  int selectedBottomBarIndex = 0;

  @action
  setBottomNavigationIsVisible(bool value) {
    bottomNavigationIsVisible = value;
  }

  @action
  onItemTapped(int index) {
    if(selectedBottomBarIndex != index) {
      selectedBottomBarIndex = index;
    }
  }

}